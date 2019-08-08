import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weibo_flutter/const/iconfont.dart';
import 'package:weibo_flutter/modules/home/page.dart';
import 'package:weibo_flutter/modules/message/page.dart';
import 'package:weibo_flutter/modules/search/page.dart';
import 'package:weibo_flutter/modules/setting/page.dart';
import 'package:weibo_flutter/modules/video/page.dart';

class ApplicationModel {
  static final List<Widget> tabControllers = [
    HomePage().buildPage(null),
    VideoPage().buildPage(null),
    SearchPage().buildPage(null),
    MessagePage().buildPage(null),
    SettingPage().buildPage(null)
  ];

  static final List<String> tabTitles = ['首页', '视频', '发现', '消息', '我的'];

  static final List<Icon> tabIcons = [
    Icon(IconF.home),
    Icon(IconF.video),
    Icon(IconF.search),
    Icon(IconF.message),
    Icon(IconF.my)
  ];

  static final List<Icon> tabSelectIcons = [
    Icon(IconF.home_select),
    Icon(IconF.video_select),
    Icon(IconF.search_select),
    Icon(IconF.message_select),
    Icon(IconF.my_select)
  ];

  static final List<BottomNavigationBarItem> items = [
    getCTab(tabTitles[0], tabIcons[0], tabSelectIcons[0]),
    getCTab(tabTitles[1], tabIcons[1], tabSelectIcons[1]),
    getCTab(tabTitles[2], tabIcons[2], tabSelectIcons[2]),
    getCTab(tabTitles[3], tabIcons[3], tabSelectIcons[3]),
    getCTab(tabTitles[4], tabIcons[4], tabSelectIcons[4])
  ];

  static BottomNavigationBarItem getCTab(
      String title, Icon icon, Icon selectIcon) {
    return new BottomNavigationBarItem(
      title: Text(title),
      icon: icon,
      activeIcon: selectIcon,
    );
  }
}
