import 'dart:core';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/widget/attributed/AttributeString.dart';
import 'package:weibo_flutter/widget/comment/comment.dart';
import 'package:weibo_flutter/widget/header/home_header.dart';
import 'package:weibo_flutter/widget/image/image_group_view.dart';

Widget buildView(
    List<dynamic> array, Dispatch dispatch, ViewService viewService) {
  Item state = array.first as Item;
  List<EmotionItem> emotions = array.last as List<EmotionItem>;
  return Container(
    color: GpColors.keyboardPressBgColor,
    child: Container(
      margin: const EdgeInsets.only(top: 10),
      color: GpColors.foregroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: _getItemView(state, dispatch, viewService, emotions),
      ),
    ),
  );
}

Widget _getItemView(Item state, Dispatch dispatch, ViewService viewService,
    List<EmotionItem> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _getHeaderRow(state, dispatch, viewService),
      _getCenterText(state, dispatch, viewService, items),
      _getImageView(state, dispatch, viewService, items),
      _getBottomRow(state, dispatch, viewService),
    ],
  );
}

Widget _getHeaderRow(Item state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: HomeHeaderView(
      headerItem: state,
    ),
  );
}

Widget _getCenterText(Item state, Dispatch dispatch, ViewService viewService,
    List<EmotionItem> items) {
  return AttributeString(state.text, items);
}

Widget _getImageView(Item state, Dispatch dispatch, ViewService viewService,
    List<EmotionItem> items) {
  return Container(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: _getImageViewColumn(state, dispatch, viewService, items),
    color: state.retweetedStatus == null
        ? Colors.white
        : GpColors.keyboardPressBgColor,
  );
}

Widget _getImageViewColumn(Item state, Dispatch dispatch,
    ViewService viewService, List<EmotionItem> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      if (state.retweetedStatus != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: AttributeString(
              '@${state.retweetedStatus.user.name}:' +
                  state.retweetedStatus.text,
              items),
        ),
      ImageGroupView(
        picList: state.retweetedStatus != null
            ? state.retweetedStatus.picUrls
            : state.picUrls,
      ),
    ],
  );
}

Widget _getBottomRow(Item state, Dispatch dispatch, ViewService viewService) {
  return CommentWidget(
      repostsCount: state.repostsCount,
      commentsCount: state.commentsCount,
      attitudesCount: state.attitudesCount);
}
