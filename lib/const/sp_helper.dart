import 'package:shared_preferences/shared_preferences.dart';
import 'package:weibo_flutter/const/const.dart';
import 'package:weibo_flutter/const/userDefault.dart';

class SpHelper {
  static SpHelper _instance;
  static Future<SpHelper> get instance async {
    return await getInstance();
  }

  static SharedPreferences _spf;

  SpHelper._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  // 判断是否存在数据
  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    if (_beforeCheck()) return null;
    return _spf.getKeys();
  }

  static Future<SpHelper> getInstance() async {
    if (_instance == null) {
      _instance = new SpHelper._();
      await _instance._init();
    }
    return _instance;
  }

  static Future<bool> setString(String value, String key) async {
    if (_beforeCheck()) {
//      print('>>>>>>>>>>sqf是空');
      _spf = await SharedPreferences.getInstance();
    }

    return _spf.setString(key, value);
  }

  static Future<bool> setInt(int value, String key) {
    return _spf.setInt(key, value);
  }

  String getAccessToken() {
    if (_beforeCheck()) return null;
    if (_spf.getKeys().contains(UserDefaults.TOKEN_KEY)) {
      return _spf.getString(UserDefaults.TOKEN_KEY);
    }
    return null;
  }

  String getExpiresTime() {
    if (_beforeCheck()) return null;
    if (_spf.getKeys().contains(UserDefaults.TOKEN_TIME_KEY)) {
      return _spf.getString(UserDefaults.TOKEN_TIME_KEY);
    }
    return null;
  }

  bool isLogin() {
    String value = getAccessToken();
    print('>>>>>>>> token: $value');
    return getAccessToken() != null;
  }

  bool isValid() {
    String value = getExpiresTime();
    if (value == null) {
      return false;
    }
    final now = DateTime.now();
    final expiresTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(value) * 1000);
    print(
        '>>>>>>>> isValid: $value expiresTime: ${expiresTime.compareTo(now)}');
    return expiresTime.compareTo(now) == 1 ? true : false;
  }

  showWBoo() {
    final bool1 = isLogin();
    final bool2 = isValid();
    return (bool1 && bool2);
  }
}
