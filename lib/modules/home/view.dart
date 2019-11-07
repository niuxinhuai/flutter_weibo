import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/widget/appbar.dart';
import 'package:weibo_flutter/widget/loading.dart';
import 'package:weibo_flutter/widget/refresh_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: FWAppBar(
      showGradient: true,
      title: Text('首页'),
    ),
    body: state.items.isEmpty
        ? Loading()
        : ZMRefreshIndicator(
            controller: state.refreshController,
            enablePullDown: true,
            onLoading: () => dispatch(HomeActionCreator.onLoadingAction()),
            onRefresh: () => dispatch(HomeActionCreator.onRefreshAction()),
            child: ListView.builder(
              itemBuilder: adapter.itemBuilder,
              itemCount: adapter.itemCount,
            ),
          ),
  );
}
