// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthToken _$OauthTokenFromJson(Map<String, dynamic> json) {
  return OauthToken()
    ..accessToken = json['access_token'] as String
    ..expires = json['expires_in'] as int
    ..isRealName = json['isRealName'] as String
    ..remind = json['remind_in'] as String
    ..uid = json['uid'] as String;
}

Map<String, dynamic> _$OauthTokenToJson(OauthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expires,
      'isRealName': instance.isRealName,
      'remind_in': instance.remind,
      'uid': instance.uid,
    };
