import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:flutter/gestures.dart';

class StringUtil {
  static String getTypeName(dynamic obj) {
    if (obj is String) {
      return 'String';
    } else if (obj is int) {
      return 'int';
    } else {
      return 'Any';
    }
  }

  static String getSourceString(String sourceStr) {
    var source = sourceStr;
    final String pix = '>';
    if (sourceStr.contains(pix)) {
//      print(
//          '>>>>>>出现位置 ${source.indexOf(pix)}  ${source.lastIndexOf(pix)}  $source');
      String str = source.substring(0, source.length - 4);
      return str.split('>').last;
    }
    return source;
  }

  //* 获取高清图片 */
  static String getLargeImageUrlString(String normalImageUrl) {
    String large = normalImageUrl;
    if (normalImageUrl.contains('thumbnail')) {
      large = normalImageUrl.replaceAll('thumbnail', 'large');
    }
    return large;
  }

  //* 获取标清图片 */
  static String getBmiddleImageUrlString(String normalImageUrl) {
    String bmiddle = normalImageUrl;
    if (normalImageUrl.contains('thumbnail')) {
      bmiddle = normalImageUrl.replaceAll('thumbnail', 'large');
    }
    return bmiddle;
  }

  //* 修改文本内容 */
  static Widget replaceLargeText(String text, BuildContext context) {
    if (text.isEmpty || text == null) {
      return Container();
    }
    final specilText = '#';
    final specilAllText = '全文';
    final perfixUrl = 'http';
    String richBodyText = '';
    List<String> array = [];
    if (text.contains(specilText)) {
      String spText = text.substring(text.indexOf(specilText),text.lastIndexOf(specilText));
      richBodyText = spText.replaceAll(specilText, '');
      array = text.split(new RegExp('#'));
    } else {
      array.add(text);
    }
    if (array.length == 1 && !text.contains(specilAllText)) {
      return Text(
        text,
        style: Theme.of(context).textTheme.body1,
      );
    }
    List<TextSpan> spans = [];
    for (int i = 0; i < array.length; ++i) {
      String value = array[i];
      if (value == richBodyText) {
        value = '#$value#';
      }
      if (i == array.length - 1) {
        if (value.contains(specilAllText)) {
          List<String> childArray = value.split(specilAllText);
          final String first = childArray.first;
          final String last = childArray.last;

          TextSpan textSpan = _getTextSpan(first, false, '', context);
          spans.add(textSpan);

          TextSpan lastTextSpan = _getTextSpan(specilAllText, true, last, context);
          spans.add(lastTextSpan);

        } else {
          if (value.contains(perfixUrl)) {
            List<String> spltUrls = value.split(new RegExp('\\s+'));
            for (var str in spltUrls) {
              if (str.isNotEmpty) {
                if (str.contains(perfixUrl)) {
                  List<String>urls = str.split(perfixUrl);
                  TextSpan textSpan = _getTextSpan(urls.first, false, '', context);
                  spans.add(textSpan);
                  TextSpan lastUrltextSpan = _getTextSpan('🔗网页链接 ', true, perfixUrl + urls.last, context);
                  spans.add(lastUrltextSpan);
                } else {
                  TextSpan textSpan = _getTextSpan(str, false, '', context);
                  spans.add(textSpan);
                }
              }
            }
          } else {
            TextSpan textSpan = _getTextSpan(value, false, value, context);
            spans.add(textSpan);
          }
        }

      } else {
        TextSpan textSpan = _getTextSpan(value, value.contains(specilText) ? true : false, value, context);
        spans.add(textSpan);
      }
    }
    return RichText(text: TextSpan(children: spans));
  }
}

TextSpan _getTextSpan(String text, bool canTap, String tapText, BuildContext context) {
  if (!canTap) {
    TextSpan textSpan = TextSpan(
        text: text,
        style: Theme.of(context).textTheme.body1.copyWith(color: GpColors.appbarTextColor)
    );
    return textSpan;
  }
  TextSpan textSpan = TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = () { print('>>>点击了：：：$tapText'); },
      style: Theme.of(context).textTheme.body1.copyWith(color: GpColors.sourceColor)
  );
  return textSpan;
}
