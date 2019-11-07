import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/utils/emnu_type.dart';
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
        if (parameter is Map) {
          final Map map = parameter;
          int key_type = map.keys.first;
          String value = map.values.first.toString();
          switch (key_type) {
            case EmnuType.HOME_RICH_SEARCH:
              print(">>>>富文本点击搜索:$value"); //#天天⑪号0点预告#
              break;
            case EmnuType.HOME_RICH_USER:
              print(">>>>富文本点击用户中心:$value"); //@连线记者:
              break;
            case EmnuType.HOME_RICH_PAPER:
              print(
                  ">>>>富文本点击查看全文:$value"); //http://m.weibo.cn/1796086707/4435925251527968​
              break;
            case EmnuType.HOME_RICH_VIDEO:
              print(">>>>富文本点击视频链接:$value"); //http://t.cn/AiBTGyw4
              break;
            default:
              break;
          }
        }
      },
    );
  }
}
