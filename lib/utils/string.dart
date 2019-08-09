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
}
