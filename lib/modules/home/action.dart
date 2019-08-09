import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

//TODO replace with your own action
enum HomeAction { action, didSourceFeatch }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action didSource(HomeModel model) {
    return Action(HomeAction.didSourceFeatch, payload: model);
  }
}
