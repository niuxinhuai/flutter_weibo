import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/utils/emnu_type.dart';
import 'package:weibo_flutter/utils/special_text_string.dart';

class PaperSpecialText extends SpecialText {
  static const String flag = "全文";
  final int start;
  final String mainText;
  PaperSpecialText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.start, this.mainText})
      : super(flag, "：", textStyle, onTap: onTap);

  @override
  InlineSpan finishText() {
    final String text = AttributedStringSpecialTextUtil.paperFlag;
    final String tapStr = _getTapString();
//    print('>>>>>全文:$text');
    return SpecialTextSpan(
        text: text,
        actualText: text,
        start: start,
        deleteAll: true,
        style: textStyle?.copyWith(color: GpColors.sourceColor),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap({EmnuType.HOME_RICH_PAPER: tapStr});
          });
  }

  String _getTapString() {
    String str = '';
    str = mainText.split("全文：").last.replaceAll(" ", "");
    return str;
  }
}
