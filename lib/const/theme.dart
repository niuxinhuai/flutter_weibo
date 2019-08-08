import 'colors.dart';
import 'package:flutter/material.dart';

///https://material.io/design/color/#color-theme-creation
final ThemeData gpTheme = ThemeData(
  dividerColor: GpColors.divider,
  primarySwatch: GpColors.primary,
  primaryColor: GpColors.primary,
  //前景色
  accentColor: GpColors.secondary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: GpColors.backgroundColor,
  backgroundColor: GpColors.backgroundColor,
  //checkbox radio switch 选中颜色
  toggleableActiveColor: GpColors.primary,
  disabledColor: GpColors.disableColor,
  unselectedWidgetColor: GpColors.disableColor,
  cardColor: GpColors.foregroundColor,
  hintColor: GpColors.hintTextColor,
  errorColor: GpColors.hintErrorTextColor,
  bottomAppBarColor: GpColors.foregroundColor,
  canvasColor: GpColors.backgroundColor,
  //InkWell按下效果
  highlightColor: GpColors.keyboardPressBgColor,
  //InkWell波纹扩散颜色
  splashColor: Color(0x66c8c8c8),
  //选择行颜色
  selectedRowColor: Color(0xfff5f5f5),
  secondaryHeaderColor: Color(0xffe3f2fd),

  indicatorColor: GpColors.indicatorSelectColor,

  fontFamily: 'notosans',

  colorScheme: ColorScheme(
    primary: GpColors.primary,

    //夜间模式
    primaryVariant: GpColors.primary,
    secondary: GpColors.secondary,
    secondaryVariant: GpColors.secondary,

    //前景色
    surface: GpColors.foregroundColor,
    background: GpColors.backgroundColor,
    error: GpColors.hintErrorTextColor,

    //在primary位置的字的颜色
    onPrimary: GpColors.normalTextColor,
    onSecondary: GpColors.normalTextColor,
    onSurface: GpColors.normalTextColor,
    onBackground: GpColors.normalTextColor,
    onError: GpColors.hintErrorTextColor,
    brightness: Brightness.light,
  ),

  ///appBarTheme
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
          title: TextStyle(
        color: GpColors.appbarTextColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      )),
      color: GpColors.foregroundColor,
      actionsIconTheme: IconThemeData(color: GpColors.appbarIconColor),
      iconTheme: IconThemeData(color: GpColors.appbarIconColor),
      elevation: 1),

  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    // indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: GpColors.indicatorSelectColor, width: 2)),
    labelColor: GpColors.normalTextColor,
    unselectedLabelColor: GpColors.normalTextColor,
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    padding: EdgeInsets.only(top: 9, bottom: 9, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GpColors.yellowBtnBgColor,
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(100.0)),
    ),
    alignedDropdown: false,
    buttonColor: GpColors.yellowBtnBgColor,
    disabledColor: GpColors.disableColor,
    highlightColor: GpColors.yellowBtnBgColor,
//    splashColor: Color(0x1f000000),
  ),

  ///icon
  iconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  primaryIconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  accentIconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  dialogTheme: DialogTheme(
      backgroundColor: GpColors.foregroundColor,
      shape: RoundedRectangleBorder(
//        side: BorderSide(
//          color: Color(0xff000000),
//          width: 0.0,
//          style: BorderStyle.none,
//        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 24,
      titleTextStyle: TextStyle(
        color: GpColors.normalTextColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      contentTextStyle: TextStyle(
        color: GpColors.normalTextColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      )),

  textTheme: TextTheme(
    display4: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
    //showDatePicker里的date使用
    display3: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
    display2: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    display1: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///大标题  例如：showDatePicker里的month、year使用
    headline: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),

    ///中标题  例如：AppBar.title和AlertDialog.title
    title: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///次标题  例如：ListView 中ListTile.title
    subhead: TextStyle(
      color: GpColors.normalSubTextColor,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///小标题
    subtitle: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///默认
    body1: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///说明文字
    body2: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///图表的标题栏
    caption: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    ///按钮
    button: TextStyle(
      color: GpColors.yellowBtnTextColor,
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),

    overline: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
);

class GpOtherTheme {
  ///中标题灰色
  static TextStyle titleGrey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .title
        .copyWith(color: GpColors.hintTextColor);
  }

  ///次标题灰色
  static TextStyle subheadGrey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subhead
        .copyWith(color: GpColors.hintTextColor);
  }

  ///小标题灰色
  static TextStyle subtitlGrey(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle
        .copyWith(color: GpColors.hintTextColor);
  }
}
