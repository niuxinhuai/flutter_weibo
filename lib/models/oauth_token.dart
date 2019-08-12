import 'package:json_annotation/json_annotation.dart';

part 'oauth_token.g.dart';

// https://open.weibo.com/wiki/Oauth2/access_token
@JsonSerializable()
class OauthToken {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "expires_in")
  int expires; // access_token的生命周期，单位是秒数
  String isRealName;
  @JsonKey(name: "remind_in")
  String remind;
  String uid;

  OauthToken();

  factory OauthToken.fromJson(Map<String, dynamic> json) =>
      _$OauthTokenFromJson(json);

  toJson() => _$OauthTokenToJson(this);
}
