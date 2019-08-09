import 'package:json_annotation/json_annotation.dart';

part 'oauth_token.g.dart';

@JsonSerializable()
class OauthToken {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "expires_in")
  int expires;
  String isRealName;
  @JsonKey(name: "remind_in")
  String remind;
  String uid;

  OauthToken();

  factory OauthToken.fromJson(Map<String, dynamic> json) =>
      _$OauthTokenFromJson(json);

  toJson() => _$OauthTokenToJson(this);
}
