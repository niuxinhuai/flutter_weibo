import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ListHeaderState> buildEffect() {
  return combineEffects(<Object, Effect<ListHeaderState>>{
    ListHeaderAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ListHeaderState> ctx) {
}
