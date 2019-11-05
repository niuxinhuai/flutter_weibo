import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/widget/attributed/special_text_span_builder.dart';

class AttributeString extends StatelessWidget {
  final String text;
  final List<EmotionItem> emotions;
  AttributeString(this.text, this.emotions);

  @override
  Widget build(BuildContext context) {
    return ExtendedText(
      text,
      specialTextSpanBuilder:
          CustomSpecialTextSpanBuilder(emotions: emotions, text: text),
      onSpecialTextTap: (dynamic parameter) {
        String tapStr = parameter.toString();
        print(">>>>富文本点击:$tapStr>>>>>");
      },
    );
  }
}
