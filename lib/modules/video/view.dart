import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/widget/appbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(VideoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: FWAppBar(
      title: Text('视频'),
    ),
    body: _getItem(),
  );
}

Widget _getItem() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('3笔报销单，发票总金额为1231231231231312313132131232131元人民币呀'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('审核人:皮卡丘呀'),
                Text('审核人:皮卡丘呀'),
                Text('审核人:皮卡丘呀'),
                Text('审核人:皮卡丘呀'),
              ],
            ),
            Text(
              '28310.000',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    ),
  );
}
