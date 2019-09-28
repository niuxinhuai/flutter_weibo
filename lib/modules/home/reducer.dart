import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.didLoading: _didLoadingAction,
      HomeAction.didLoadingError: _didLoadingErrorAction,
      HomeAction.didRefresh: _didSourceAction,
      HomeAction.didRefreshError: didRefreshErrorAction,
    },
  );
}

HomeState _didSourceAction(HomeState state, Action action) {
  final HomeModel model = action.payload;
  final HomeState newState = state.clone();
  newState.model = model;
  newState.items.clear();
  newState.items.addAll(model.items);
  if (model == null || model.items == null || model.items.length < newState.count) {
    newState.refreshController.loadNoData();
  } else {
    newState.refreshController.refreshCompleted();
    newState.page ++;
  }
  return newState;
}

HomeState didRefreshErrorAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  print('>>>>>>>>>>refresh error');
  newState.refreshController.refreshCompleted();
  return newState;
}

HomeState _didLoadingAction(HomeState state, Action action) {
  final HomeModel model = action.payload;
  final HomeState newState = state.clone();
  if (model == null || model.items == null || model.items.length < newState.count) {
    newState.refreshController.loadNoData();
  } else {
    newState.refreshController.refreshCompleted();
    newState.page ++;
  }
  newState.items.addAll(model.items);
  return newState;
}

HomeState _didLoadingErrorAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  print('>>>>>>>>>>loading error');
  newState.refreshController.refreshCompleted();
  return newState;
}
