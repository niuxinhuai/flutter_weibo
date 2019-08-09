import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/utils/date.dart';
import 'package:weibo_flutter/utils/string.dart';
import 'package:weibo_flutter/widget/imageview.dart';

Widget buildView(Item state, Dispatch dispatch, ViewService viewService) {
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
                      '刚刚',
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
        Container(
          width: 40,
          height: 30,
          color: GpColors.randomColor(),
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
    child: _getCustomImageView(state, dispatch, viewService),
    color: GpColors.keyboardPressBgColor,
  );
}

Widget _getCustomImageView(
    Item state, Dispatch dispatch, ViewService viewService) {
  List<Pic> picArray = [];
  if (state.picUrls == null || state.picUrls.length == 0) {
    return Container();
  } else if (state.picUrls.length > 9) {
    for (int i = 0; i < state.picUrls.length; ++i) {
      if (i > 8) {
        break;
      }
      picArray.add(state.picUrls[i]);
    }
  } else {
    for (int i = 0; i < state.picUrls.length; ++i) {
      picArray.add(state.picUrls[i]);
    }
  }
  return GridView.count(
    crossAxisCount: (picArray.length >= 3) ? 3 : picArray.length,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    physics: NeverScrollableScrollPhysics(),
//    padding: const EdgeInsets.all(10),
    shrinkWrap: true,
    children: picArray.map((pic) {
      return _getImage(pic.thumbnailPic);
    }).toList(),
  );
}

Widget _getImage(String picUrl) {
  return ImageView(
    imgUrl: picUrl,
  );
}

Widget _getBottomRow(Item state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 50,
    color: GpColors.randomColor(),
  );
}
