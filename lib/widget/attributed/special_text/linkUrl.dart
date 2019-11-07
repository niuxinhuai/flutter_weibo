import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/utils/emnu_type.dart';

class LinkSpecialText extends SpecialText {
  static const String flag = "http";
  final int start;
  bool showContent; //当以"全文"结尾时，不显示链接
  LinkSpecialText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.start, this.showContent})
      : super(flag, " ", textStyle, onTap: onTap);

  @override
  InlineSpan finishText() {
    final String text = showContent ? "🔗视频链接" : "";
//    print('>>>>>link:$text   >>>>>>>show:$showContent');
    return SpecialTextSpan(
        text: text,
        actualText: text,
        start: start,
        deleteAll: true,
        style: textStyle?.copyWith(color: GpColors.sourceColor),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap({EmnuType.HOME_RICH_VIDEO: toString()});
          });
  }
}
