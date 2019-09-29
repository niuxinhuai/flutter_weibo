import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class HomeState implements Cloneable<HomeState> {
  HomeModel model;
  List<Item> items;
  SpHelper sp;
  RefreshController refreshController;
  int count = 10; ///一页返回的最大数量
  int page = 1; ///页码
  String token;
  @override
  HomeState clone() {
    return HomeState()
      ..model = model
      ..items = items
      ..refreshController = refreshController
      ..count = count
      ..page = page
      ..token = token
      ..sp = sp;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()..model = HomeModel()..refreshController = RefreshController(initialRefresh: false)..items = [];
}
