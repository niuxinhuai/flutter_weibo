import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/service/service_manager.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _init(Action action, Context<HomeState> ctx) {
  getSource(action, ctx);
}

void getSource(Action action, Context<HomeState> ctx) async {
  ctx.state.sp = await SpHelper.getInstance();
  String token = ctx.state.sp.getAccessToken();
//  print('>>>>>>>>拿到的token是 ${token}');
  ServiceManager.getHomeTimeLine(token)
      .then((json) => ctx.dispatch(HomeActionCreator.didSource(json)));
  String uid = ctx.state.sp.getUserUid();
}
