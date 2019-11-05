import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/utils/special_text_string.dart';
import 'package:weibo_flutter/widget/attributed/special_text/emoji.dart';
import 'package:weibo_flutter/widget/attributed/special_text/linkUrl.dart';
import 'package:weibo_flutter/widget/attributed/special_text/paper.dart';
import 'package:weibo_flutter/widget/attributed/special_text/search.dart';
import 'package:weibo_flutter/widget/attributed/special_text/user_center.dart';

class CustomSpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  final List<EmotionItem> emotions;
  final String text;
  CustomSpecialTextSpanBuilder({this.emotions, this.text});

  @override
  TextSpan build(String data, {TextStyle textStyle, onTap}) {
    return super.build(data, textStyle: textStyle, onTap: onTap);
  }

  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, onTap, int index}) {
    if (flag == null || flag == "") return null;
    if (isStart(flag, AttributedStringSpecialTextUtil.emotionFlag)) {
      return EmojiSpecialText(textStyle,
          start:
              index - (AttributedStringSpecialTextUtil.emotionFlag.length - 1),
          emotions: emotions);
    } else if (isStart(flag, AttributedStringSpecialTextUtil.searchFlag)) {
      return SearchSpecialText(textStyle, onTap,
          start:
              index - (AttributedStringSpecialTextUtil.searchFlag.length - 1));
    } else if (isStart(flag, AttributedStringSpecialTextUtil.paperFlag)) {
      return PaperSpecialText(textStyle, onTap,
          start: index - (AttributedStringSpecialTextUtil.paperFlag.length - 1),
          mainText: text);
    } else if (isStart(flag, AttributedStringSpecialTextUtil.userFlag)) {
      return UserSpecialText(textStyle, onTap,
          start: index - (AttributedStringSpecialTextUtil.userFlag.length - 1));
    } else if (isStart(flag, AttributedStringSpecialTextUtil.linkFlag)) {
      return LinkSpecialText(textStyle, onTap,
          start: index - (AttributedStringSpecialTextUtil.linkFlag.length - 1),
          showContent: !text.contains("全文"));
    }
    return null;
  }
}
