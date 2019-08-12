import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/const/iconfont.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/utils/date.dart';
import 'package:weibo_flutter/utils/string.dart';
import 'package:weibo_flutter/widget/imageview.dart';

Widget buildView(Item state, Dispatch dispatch, ViewService viewService) {
  _gg();
  return Container(
    color: GpColors.keyboardPressBgColor,
    child: Container(
      margin: const EdgeInsets.only(top: 10),
      color: GpColors.foregroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: _getItemView(state, dispatch, viewService),
      ),
    ),
  );
}

void _gg() async {
  SpHelper sp = await SpHelper.getInstance();
  print(
      '>>>>>>>当前的时间戳是:${DateTime.now().millisecondsSinceEpoch / 1000}, exin: ${int.parse(sp.getExpiresTime()) / 10 / 60 / 60 / 24}  max: ${1565427747258 + 157679999}');
}

Widget _getItemView(Item state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _getHeaderRow(state, dispatch, viewService),
      _getCenterText(state, dispatch, viewService),
      _getImageView(state, dispatch, viewService),
      _getBottomRow(state, dispatch, viewService),
    ],
  );
}

Widget _getHeaderRow(Item state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: <Widget>[
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.5)),
              border: Border.all(
                  width: 1, color: GpColors.dialogCancelBtnTextColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17.5),
            child: CachedNetworkImage(
              imageUrl: state.user.profileImageUrl,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  state.user.name,
                  style: Theme.of(viewService.context)
                      .textTheme
                      .body1
                      .copyWith(color: GpColors.titleColor),
                ),
                Row(
                  children: <Widget>[
                    Text(
//                      DateTimeUtil.getTimeDuration(state.createdAt),
                      DateTimeUtil.getTimeDuration(state.createdAt),
                      style: Theme.of(viewService.context)
                          .textTheme
                          .overline
                          .copyWith(color: GpColors.detailColor),
                    ),
                    if (!state.source.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: RichText(
                          text: TextSpan(
                            text: '来自',
                            style: Theme.of(viewService.context)
                                .textTheme
                                .overline
                                .copyWith(color: GpColors.detailColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: StringUtil.getSourceString(
                                      state.source), //
                                  style: Theme.of(viewService.context)
                                      .textTheme
                                      .overline
                                      .copyWith(color: GpColors.sourceColor)),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('点击了下箭头');
          },
          child: Icon(IconF.xiajiantou),
        )
      ],
    ),
  );
}

Widget _getCenterText(Item state, Dispatch dispatch, ViewService viewService) {
  return Text(
    state.text,
    style: Theme.of(viewService.context).textTheme.body1,
  );
}

Widget _getImageView(Item state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: _getImageViewColumn(state, dispatch, viewService),
    color: GpColors.keyboardPressBgColor,
  );
}

Widget _getImageViewColumn(
    Item state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      if (state.retweetedStatus != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: RichText(
            text: TextSpan(
              text: '',
              style: Theme.of(viewService.context).appBarTheme.textTheme.title,
              children: <TextSpan>[
                if (!state.retweetedStatus.user.name.isEmpty)
                  TextSpan(
                      text: '@${state.retweetedStatus.user.name}', //
                      style: Theme.of(viewService.context)
                          .textTheme
                          .subtitle
                          .copyWith(color: GpColors.sourceColor)),
                if (!state.retweetedStatus.text.isEmpty)
                  TextSpan(
                      text: ':${state.retweetedStatus.text}',
                      style: Theme.of(viewService.context)
                          .textTheme
                          .subtitle
                          .copyWith(color: GpColors.retweetedColor)),
              ],
            ),
          ),
        ),
      _getCustomImageView(state, dispatch, viewService),
    ],
  );
}

Widget _getCustomImageView(
    Item state, Dispatch dispatch, ViewService viewService) {
  List<Pic> picArray = [];
  List<Pic> picList = state.retweetedStatus != null
      ? state.retweetedStatus.picUrls
      : state.picUrls;
  if (picList == null || picList.length == 0) {
    return Container();
  } else if (picList.length > 9) {
    for (int i = 0; i < picList.length; ++i) {
      if (i > 8) {
        break;
      }
      picArray.add(picList[i]);
    }
  } else if (picList.length == 1) {
    return ImageView(
      imgUrl: picList[0].thumbnailPic,
      fit: BoxFit.fitWidth,
      picUrls: picList,
    );
//    return _getImage(state.picUrls[0].thumbnailPic);
  } else {
    for (int i = 0; i < picList.length; ++i) {
      picArray.add(picList[i]);
    }
  }
  return GridView.count(
    crossAxisCount: 3,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    physics: NeverScrollableScrollPhysics(),
//    padding: const EdgeInsets.all(10),
    shrinkWrap: true,
    children: picArray.map((pic) {
      return _getImage(pic.thumbnailPic, picList);
    }).toList(),
  );
}

Widget _getImage(String picUrl, List<Pic> pics) {
  return ImageView(
    imgUrl: picUrl,
    fit: BoxFit.cover,
    picUrls: pics,
  );
}

Widget _getBottomRow(Item state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _commonRow(IconF.zhuanfa, '转发', viewService.context),
        _commonRow(IconF.xinxi, '评论', viewService.context),
        _commonRow(IconF.dianzan, '点赞', viewService.context),
      ],
    ),
  );
}

Widget _commonRow(IconData data, String text, BuildContext context) {
  return Row(
    children: <Widget>[
      Icon(
        data,
        size: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Text(
          text,
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    ],
  );
}
