import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';

class EmojiSpecialText extends SpecialText {
  final int start;
  final List<EmotionItem> emotions;
  EmojiSpecialText(TextStyle textStyle, {this.start, this.emotions})
      : super("[", "]", textStyle);

  @override
  InlineSpan finishText() {
    var key = toString();
    String emotionUrl = _getEmotionPhraseUrl(key);
    if (emotionUrl.isNotEmpty) {
      final double size = 20.0;
      return ImageSpan(NetworkImage(emotionUrl),
          actualText: key,
          imageWidth: size,
          imageHeight: size,
          start: start,
          fit: BoxFit.fill,
          margin: EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0));
    }
    return TextSpan(text: key, style: textStyle);
  }

  String _getEmotionPhraseUrl(String phrase) {
    String emotionUrl = "";
    if (emotions.length == 0) return emotionUrl;
    emotions.forEach((emotion) {
      if (emotion.phrase == phrase) {
        emotionUrl = emotion.url;
      }
    });

    return emotionUrl;
  }
}
