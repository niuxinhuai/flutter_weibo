import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/utils/emnu_type.dart';

class UserSpecialText extends SpecialText {
  static const String flag = "@";
  final int start;
  UserSpecialText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.start})
      : super(flag, ":", textStyle, onTap: onTap);

  @override
  InlineSpan finishText() {
    final String text = toString();
//    print('>>>>>AT:$text   >>>>tostr:${toString()}');
    return SpecialTextSpan(
        text: text,
        actualText: text,
        start: start,
        deleteAll: true,
        style: textStyle?.copyWith(color: GpColors.sourceColor),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap({EmnuType.HOME_RICH_USER: toString()});
          });
  }
}
