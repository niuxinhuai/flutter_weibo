import 'package:weibo_flutter/const/apiConst.dart';
import 'package:weibo_flutter/const/const.dart';
import 'package:weibo_flutter/const/userDefault.dart';
import 'package:weibo_flutter/models/emotions/emotion.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/models/oauth_token.dart';
import 'package:weibo_flutter/service/service_helper.dart';
import 'package:weibo_flutter/utils/string.dart';

class ServiceManager {
  //* 获取授权登录的token数据 */
  static Future<OauthToken> getAccessToken(String code) =>
      ServiceHelper.post(API.access_token, data: {
        'client_id': Const.WEIBO_APP_KEY,
        'client_secret': Const.WEIBO_APP_SECRET,
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': Const.WEIBO_REDIRECT_URL
      }).then((json) => OauthToken.fromJson(json));

  //* 获取首页信息 */
  static Future<HomeModel> getHomeTimeLine(String token, int count, int page) =>
      ServiceHelper.get(API.home_timeline, data: {
        UserDefaults.TOKEN_KEY: token,
        UserDefaults.COUNT: count,
        UserDefaults.PAGE: page
      }).then((json) => HomeModel.fromJson(json));

  //* 获取用户关注列表 */
  static Future<List<User>> getFriendships(String token, int uid) =>
      ServiceHelper.get(API.friendships,
              data: {UserDefaults.TOKEN_KEY: token, UserDefaults.UID: uid})
          .then((json) {
        List array = json['users'];
        print('>>>>>原始数量${array.length}');
        List<User> users = [];
        for (var u in array) {
          users.add(User.fromJson(u));
        }
        return users;
      });
  //* 获取表情包 */
  static Future<List<EmotionItem>> getEmotions(String token) =>
      ServiceHelper.get(API.emotions, data: {UserDefaults.TOKEN_KEY: token})
          .then((json) {
        List<EmotionItem> items = (json as List)
            ?.map((e) => e == null
                ? null
                : EmotionItem.fromJson((e as Map)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )))
            ?.toList();
        return items;
      });
}
