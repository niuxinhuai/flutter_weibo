import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/service/service_manager.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
    HomeAction.onRefresh: _onRefresh,
    HomeAction.onLoading: _onLoading,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

///refresh
void _init(Action action, Context<HomeState> ctx) {
  getSource(action, ctx);
}

void _onRefresh(Action action, Context<HomeState> ctx) {
  _onRefreshing(action, ctx);
}

void getSource(Action action, Context<HomeState> ctx) async {
  ctx.state.sp = await SpHelper.getInstance();
  String token = ctx.state.sp.getAccessToken();
  ctx.state.token = token;

  List<EmotionItem> emotionItems = await ServiceManager.getEmotions(token);
  HomeModel model = await ServiceManager.getHomeTimeLine(
      token, ctx.state.count, ctx.state.page);
  String uid = ctx.state.sp.getUserUid();
  List<User> users =
      await ServiceManager.getFriendships(token, int.tryParse(uid));
  print('>>>>>>>>拿到的token是 ${token}  uid:$uid  length:${users.length}');
  ctx.dispatch(HomeActionCreator.didSource(model, users, emotionItems));
}

void _onRefreshing(Action action, Context<HomeState> ctx) {
  ServiceManager.getHomeTimeLine(ctx.state.token, ctx.state.count, 1)
      .then((json) => ctx.dispatch(HomeActionCreator.didRefresh(json)))
      .catchError((onError, stackTrace) =>
          ctx.dispatch(HomeActionCreator.didRefreshErrorAction()));
}

///loading more
void _onLoading(Action action, Context<HomeState> ctx) {
  if (ctx.state.page == 1) {
    ctx.state.page++;
  }
  _loadingMoreData(action, ctx);
}

void _loadingMoreData(Action action, Context<HomeState> ctx) {
  ServiceManager.getHomeTimeLine(
          ctx.state.token, ctx.state.count, ctx.state.page)
      .then((json) => ctx.dispatch(HomeActionCreator.didLoading(json)))
      .catchError((onError, stackTrace) =>
          ctx.dispatch(HomeActionCreator.didLoadingErrorAction()));
}
