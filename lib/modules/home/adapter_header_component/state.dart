import 'package:fish_redux/fish_redux.dart';

class ListHeaderState implements Cloneable<ListHeaderState> {

  @override
  ListHeaderState clone() {
    return ListHeaderState();
  }
}

ListHeaderState initState(Map<String, dynamic> args) {
  return ListHeaderState();
}
