import 'package:weibo_flutter/const/const.dart';

class API {
  //* url */
  static const baseUrl = 'https://api.weibo.com';

  static const oauth =
      '/oauth2/authorize'; //* 授权- param client_id, redirect_uri*/
  static const access_token =
      '/oauth2/access_token'; //* 获取token param - client_id, client_secret, grant_type, code, redirect_uri*/
  static const home_timeline =
      '/2/statuses/home_timeline.json'; //* home param - none Get*/
  static const send_weibo =
      '/2/statuses/update.json'; //* 发送微博 - param - none */
  static const friendships = '/2/friendships/friends.json'; //*用户关注列表  */
  static const emotions = '/2/emotions.json'; //* 获取表情包 */
  static const users =
      '/2/users/show.json'; //* users param - access_token, uid */

  static getOauthUrl() {
    return API.baseUrl +
        API.oauth +
        '?client_id=${Const.WEIBO_APP_KEY}&redirect_uri=${Const.WEIBO_REDIRECT_URL}';
  }
}
