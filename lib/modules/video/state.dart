import 'package:fish_redux/fish_redux.dart';

class VideoState implements Cloneable<VideoState> {

  @override
  VideoState clone() {
    return VideoState();
  }
}

VideoState initState(Map<String, dynamic> args) {
  return VideoState();
}
