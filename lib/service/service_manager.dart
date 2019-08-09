import 'package:weibo_flutter/const/apiConst.dart';
import 'package:weibo_flutter/const/const.dart';
import 'package:weibo_flutter/const/userDefault.dart';
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
  static Future<HomeModel> getHomeTimeLine(String token) =>
      ServiceHelper.get(API.home_timeline,
              data: {UserDefaults.TOKEN_KEY: token})
          .then((json) => HomeModel.fromJson(json));
}
