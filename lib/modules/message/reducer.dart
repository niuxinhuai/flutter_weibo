import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MessageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MessageState>>{
      MessageAction.action: _onAction,
    },
  );
}

MessageState _onAction(MessageState state, Action action) {
  final MessageState newState = state.clone();
  return newState;
}
