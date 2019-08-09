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
      String str = source.substring(0, source.length - 4);
      return str.split('>').last;
    }
    return source;
  }
}
