import 'package:fish_redux/fish_redux.dart';

class MessageState implements Cloneable<MessageState> {

  @override
  MessageState clone() {
    return MessageState();
  }
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState();
}
