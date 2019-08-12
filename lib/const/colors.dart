import 'package:flutter/material.dart';
import 'dart:math';

class GpColors {
  static Color randomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFe0f7ea),
      100: Color(0xFFb5eacb),
      200: Color(0xFF80dca9),
      300: Color(0xFF33cf86),
      400: Color(0xFF00c46b),
      500: Color(_primaryValue),
      600: Color(0xFF00a849),
      700: Color(0xFF00953d),
      800: Color(0xFF008431),
      900: Color(0xFF00641c),
    },
  );
  static const int _primaryValue = 0xFF00b753;

  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      50: Color(0xFFfff2da),
      100: Color(0xFFffdea3),
      200: Color(0xFFffc965),
      300: Color(0xFFfdb31c),
      400: Color(0xFFfca200),
      500: Color(_primaryValue),
      600: Color(0xFFf98600),
      700: Color(0xFFf47400),
      800: Color(0xFFef6300),
      900: Color(0xFFe84400),
    },
  );
  static const int _secondaryValue = 0xFFfb9200;

  static const Color appbarLineColor = Color(0xFFD5D5D5);
  static const Color appbarBackgroundColor = Color(0xFFF4F4F4);

  static const Color backgroundColor = Color(0xFFF4F7FA);
  static const Color foregroundColor = Color(0xFFFFFFFF);
  static const Color appbarIconColor = Color(0xFF9BA6AE);
  static const Color yellowBtnBgColor = Color(0xFFfec765);
  static const Color divider = Color(0xFFd8e3eb);
  static const Color indicatorSelectColor = Color(0xFFFFC95D);
  static const Color disableColor = Color(0xFFD8E3EB);
  static const Color purperColor = Color(0xFF6E82F9);

  ///text
  static const Color normalTextColor = Color(0xFF3B454F);
  static const Color normalSubTextColor = Color(0xFF9BA6AE);
  static const Color normalSubSubTextColor = Color(0xFFD8E4EB);
  static const Color hintTextColor = Color(0xFF9BA6AE);
  static const Color hintErrorTextColor = Color(0xFFF17D7D);
  static const Color appbarTextColor = Color(0xFF3B454F);
  static const Color yellowBtnTextColor = Color(0xFFFFFFFF);
  static const Color normalTextYellowColor = Color(0xFFFDBB46);

  ///write
  static const Color writeTextFieldBgColor = Color(0xFFF7F8FA);
  static const Color writeRedBgColor = Color(0xFFFA4751);
  static const Color writeAlphaGreenBgColor = Color(0xFFF5FFF5);

  ///keyboard
  static const Color keyboardBarBg = Color(0xFFF1F1F1);
  static const Color keyboardIcon = Color(0xFF333333);
  static const Color keyboardBorder = Color(0xFFE0E0E0);
  static const Color keyboardPressBgColor = Color(0x66c8c8c8);

  ///dialog
  static const Color dialogConfirmBtnTextColor = Color(0xFFFDBB46);
  static const Color dialogCancelBtnTextColor = Color(0xFF9BA6AE);

  // title
  static const Color titleColor = Color(0xFFE36B2B);
  static const Color detailColor = Color(0xFF949494);
  static const Color sourceColor = Color(0xFF5A7CAB);
  static const Color retweetedColor = Color(0xFF636363);
}
