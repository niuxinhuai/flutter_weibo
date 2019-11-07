import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/const/iconfont.dart';

class CommentWidget extends StatelessWidget {
  final int repostsCount;
  final int commentsCount;
  final int attitudesCount;

  CommentWidget(
      {this.repostsCount = 0, this.commentsCount = 0, this.attitudesCount = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
//      color: normalColor,
        border: BorderDirectional(
          top: BorderSide(
              color: GpColors.appbarLineColor,
              width: 1.0,
              style: BorderStyle.solid),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _commonRow(IconF.zhuanfa, repostsCount == 0 ? '转发' : '$repostsCount',
              context),
          _commonRow(IconF.xinxi, commentsCount == 0 ? '评论' : '$commentsCount',
              context),
          _commonRow(IconF.dianzan,
              attitudesCount == 0 ? '点赞' : '$attitudesCount', context),
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
}
