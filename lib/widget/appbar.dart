import 'package:flutter/material.dart';
import 'package:weibo_flutter/router/router.dart';

///通用 AppBar
class GpAppBar extends AppBar {
  GpAppBar({
    Key key,
    Widget leading, //返回键
    Function leadingAction, //返回键事件
    bool automaticallyImplyLeading = true,
    Widget title,
    List<Widget> actions,
    Widget flexibleSpace,
    PreferredSizeWidget bottom,
    double elevation,
    ShapeBorder shape,
    Color backgroundColor,
    Brightness brightness,
    IconThemeData iconTheme,
    IconThemeData actionsIconTheme,
    TextTheme textTheme,
    bool primary = true,
    bool centerTitle = true,
    double titleSpacing = NavigationToolbar.kMiddleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
  }) : super(
            key: key,
            leading: leading ??
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: leadingAction ??
                      () {
                        print('点击了返回键');
                      },
                ),
            automaticallyImplyLeading: automaticallyImplyLeading,
            title: title,
            actions: actions,
            flexibleSpace: flexibleSpace,
            bottom: bottom,
            elevation: elevation,
            shape: shape,
            backgroundColor: backgroundColor,
            brightness: brightness,
            iconTheme: iconTheme,
            actionsIconTheme: actionsIconTheme,
            textTheme: textTheme,
            primary: primary,
            centerTitle: centerTitle,
            titleSpacing: titleSpacing,
            toolbarOpacity: toolbarOpacity,
            bottomOpacity: bottomOpacity);
}
