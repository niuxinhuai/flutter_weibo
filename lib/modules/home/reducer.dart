import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.didSourceFeatch: _didSourceFeatchAction,
      HomeAction.didLoading: _didLoadingAction,
      HomeAction.didLoadingError: _didLoadingErrorAction,
      HomeAction.didRefresh: _didRefreshAction,
      HomeAction.didRefreshError: didRefreshErrorAction,
    },
  );
}

HomeState _didSourceFeatchAction(HomeState state, Action action) {
  final Tuple2<HomeModel, List<User>> t2 = action.payload;
  final HomeState newState = state.clone();
  newState.model = t2.i0;
  newState.items.clear();
  if (t2.i0 == null || t2.i0.items == null || t2.i0.items.length < newState.count) {
    newState.refreshController.loadNoData();
  } else {
    newState.refreshController.refreshCompleted();
    newState.page ++;
  }
  newState.items = t2.i0.items;
  newState.users = t2.i1;
  newState.users.insert(0, User());
  return newState;
}

HomeState _didRefreshAction(HomeState state, Action action) {
  final HomeModel model = action.payload;
  final HomeState newState = state.clone();
  newState.model = model;
  newState.items.clear();
  if (model == null || model.items == null || model.items.length < newState.count) {
    newState.refreshController.loadNoData();
  } else {
    newState.refreshController.refreshCompleted();
  }
  newState.items = model.items;
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
