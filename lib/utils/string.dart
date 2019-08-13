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
}
