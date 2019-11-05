import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/models/home_model.dart';

//TODO replace with your own action
enum HomeAction {
  action,
  didSourceFeatch,
  onRefresh,
  onLoading,
  didRefresh,
  didLoading,
  didLoadingError,
  didRefreshError,
}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action didSource(
      HomeModel model, List<User> user, List<EmotionItem> items) {
    return Action(HomeAction.didSourceFeatch,
        payload: Tuple3(model, user, items));
  }

  static Action onRefreshAction() {
    return const Action(HomeAction.onRefresh);
  }

  static Action onLoadingAction() {
    return const Action(HomeAction.onLoading);
  }

  static Action didRefresh(HomeModel model) {
    return Action(HomeAction.didRefresh, payload: model);
  }

  static Action didLoading(HomeModel model) {
    return Action(HomeAction.didLoading, payload: model);
  }

  static Action didLoadingErrorAction() {
    return const Action(HomeAction.didLoadingError);
  }

  static Action didRefreshErrorAction() {
    return const Action(HomeAction.didRefreshError);
  }
}
