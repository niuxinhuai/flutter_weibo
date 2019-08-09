import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.didSourceFeatch: _didSourceAction,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _didSourceAction(HomeState state, Action action) {
  final HomeModel model = action.payload;
  final HomeState newState = state.clone();
  newState.model = model;
  return newState;
}
