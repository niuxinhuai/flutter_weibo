import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListHeaderAction { action }

class ListHeaderActionCreator {
  static Action onAction() {
    return const Action(ListHeaderAction.action);
  }
}
