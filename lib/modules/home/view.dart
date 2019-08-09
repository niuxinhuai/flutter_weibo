import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/widget/appbar.dart';
import 'package:weibo_flutter/widget/loading.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: FWAppBar(
      title: Text('首页'),
    ),
    body: state.model.items == null
        ? Loading()
        : ListView.builder(
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ),
  );
}
