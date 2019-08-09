import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/models/home_model.dart';

class HomeState implements Cloneable<HomeState> {
  HomeModel model;
  SpHelper sp;
  @override
  HomeState clone() {
    return HomeState()
      ..model = model
      ..sp = sp;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()..model = HomeModel();
}
