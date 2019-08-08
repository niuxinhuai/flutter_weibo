import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/widget/appbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: FWAppBar(
      title: Text('搜索'),
    ),
  );
}
