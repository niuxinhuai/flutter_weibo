import 'package:flutter/material.dart';
import 'package:weibo_flutter/utils/animation.dart';

class Router {
  //** 跳转增加动画  */
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext c, Animation<double> animation,
            Animation<double> sdAnimation) {
      return widget;
    }, transitionsBuilder: (BuildContext c, Animation<double> animation,
        Animation<double> sdAnimation, Widget child) {
      return AnimationUtil.transition(animation, child);
    }));
  }

  //**  返回pop */
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
