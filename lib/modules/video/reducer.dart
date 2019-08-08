import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoState>>{
      VideoAction.action: _onAction,
    },
  );
}

VideoState _onAction(VideoState state, Action action) {
  final VideoState newState = state.clone();
  return newState;
}
