import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/const/iconfont.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/utils/date.dart';
import 'package:weibo_flutter/utils/string.dart';
import 'package:weibo_flutter/widget/image/borderAvatarImage.dart';

class HomeHeaderView extends StatelessWidget {
  final Item headerItem;
  HomeHeaderView({this.headerItem});

  @override
  Widget build(BuildContext context) {
    if (headerItem == null) {
      return Container();
    }
    return Row(
      children: <Widget>[
        BorderAvatarImage(
          avatarUrl: headerItem.user.profileImageUrl,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  headerItem.user.name,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: GpColors.titleColor),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      DateTimeUtil.getTimeDuration(headerItem.createdAt),
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          .copyWith(color: GpColors.detailColor),
                    ),
                    if (headerItem.source.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: RichText(
                          text: TextSpan(
                            text: '来自',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                .copyWith(color: GpColors.detailColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: StringUtil.getSourceString(
                                      headerItem.source), //
                                  style: Theme.of(context)
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
    );
  }
}
