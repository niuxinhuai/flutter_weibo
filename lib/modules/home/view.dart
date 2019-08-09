import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/widget/appbar.dart';
import 'package:weibo_flutter/widget/loading.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: FWAppBar(
      title: Text('首页'),
    ),
    body: state.model.items == null
        ? Loading()
        : Container(
            child: Center(
              child: Text('拿到数据了'),
            ),
          ),
  );
}
