import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListHeaderState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListHeaderState>>{
      ListHeaderAction.action: _onAction,
    },
  );
}

ListHeaderState _onAction(ListHeaderState state, Action action) {
  final ListHeaderState newState = state.clone();
  return newState;
}
