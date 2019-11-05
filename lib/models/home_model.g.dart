// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map json) {
  return HomeModel()
    ..hasUnread = json['has_unread'] as int
    ..maxIdStr = json['max_id_str'] as String
    ..maxId = json['max_id'] as int
    ..sinceIdStr = json['since_id_str'] as String
    ..sinceId = json['since_id'] as int
    ..uveBlank = json['uve_blank'] as int
    ..interval = json['interval'] as int
    ..totalNumber = json['total_number'] as int
    ..nextCursorStr = json['next_cursor_str'] as String
    ..previousCursorStr = json['previous_cursor_str'] as String
    ..nextCursor = json['next_cursor'] as int
    ..previousCursor = json['previous_cursor'] as int
    ..hasvisible = json['hasvisible'] as bool
    ..items = (json['statuses'] as List)
        ?.map((e) => e == null
            ? null
            : Item.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList();
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'has_unread': instance.hasUnread,
      'max_id_str': instance.maxIdStr,
      'max_id': instance.maxId,
      'since_id_str': instance.sinceIdStr,
      'since_id': instance.sinceId,
      'uve_blank': instance.uveBlank,
      'interval': instance.interval,
      'total_number': instance.totalNumber,
      'next_cursor_str': instance.nextCursorStr,
      'previous_cursor_str': instance.previousCursorStr,
      'next_cursor': instance.nextCursor,
      'previous_cursor': instance.previousCursor,
      'hasvisible': instance.hasvisible,
      'statuses': instance.items,
    };

Item _$ItemFromJson(Map json) {
  return Item()
    ..createdAt = json['created_at'] as String
    ..id = json['id'] as int
    ..idstr = json['idstr'] as String
    ..mid = json['mid'] as String
    ..canEdit = json['can_edit'] as bool
    ..showAdd = json['show_additional_indication'] as int
    ..text = json['text'] as String
    ..textLength = json['textLength'] as int
    ..allowClick = json['source_allowclick'] as int
    ..sourceType = json['source_type'] as int
    ..source = json['source'] as String
    ..favorited = json['favorited'] as bool
    ..truncated = json['truncated'] as bool
    ..inReplyToStatusId = json['in_reply_to_status_id'] as String
    ..inReplyToUserId = json['in_reply_to_user_id'] as String
    ..inReplyToScreenName = json['in_reply_to_screen_name'] as String
    ..picUrls = (json['pic_urls'] as List)
        ?.map((e) => e == null
            ? null
            : Pic.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList()
    ..thumbnailPic = json['thumbnail_pic'] as String
    ..bmiddlePic = json['bmiddle_pic'] as String
    ..originalPic = json['original_pic'] as String
    ..paid = json['is_paid'] as bool
    ..mblogVipType = json['mblog_vip_type'] as int
    ..user = json['user'] == null
        ? null
        : User.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))
    ..retweetedStatus = json['retweeted_status'] == null
        ? null
        : Item.fromJson((json['retweeted_status'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))
    ..repostsCount = json['reposts_count'] as int
    ..commentsCount = json['comments_count'] as int
    ..attitudesCount = json['attitudes_count'] as int
    ..pendingApprovalCount = json['pending_approval_count'] as int
    ..isLongText = json['isLongText'] as bool
    ..rewardExhibitionType = json['reward_exhibition_type'] as int
    ..rewardScheme = json['reward_scheme'] as String
    ..hideFlag = json['hide_flag'] as int
    ..mlevel = json['mlevel'] as int
    ..visible = json['visible'] == null
        ? null
        : Visible.fromJson((json['visible'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))
    ..bizFature = json['biz_feature'] as int
    ..hasActionTypeCard = json['hasActionTypeCard'] as int
    ..mblogtype = json['mblogtype'] as int
    ..rid = json['rid'] as String
    ..userType = json['userType'] as int
    ..moreInfoType = json['more_info_type'] as int
    ..cardid = json['cardid'] as String
    ..numberDisplayStrategy = json['number_display_strategy'] == null
        ? null
        : DisplayStrategy.fromJson(
            (json['number_display_strategy'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))
    ..positiveRecomFlag = json['positive_recom_flag'] as int
    ..contentAuth = json['content_auth'] as int
    ..gifIds = json['gif_ids'] as String
    ..isShowBulletin = json['is_show_bulletin'] as int
    ..picNum = json['pic_num'] as int;
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'id': instance.id,
      'idstr': instance.idstr,
      'mid': instance.mid,
      'can_edit': instance.canEdit,
      'show_additional_indication': instance.showAdd,
      'text': instance.text,
      'textLength': instance.textLength,
      'source_allowclick': instance.allowClick,
      'source_type': instance.sourceType,
      'source': instance.source,
      'favorited': instance.favorited,
      'truncated': instance.truncated,
      'in_reply_to_status_id': instance.inReplyToStatusId,
      'in_reply_to_user_id': instance.inReplyToUserId,
      'in_reply_to_screen_name': instance.inReplyToScreenName,
      'pic_urls': instance.picUrls,
      'thumbnail_pic': instance.thumbnailPic,
      'bmiddle_pic': instance.bmiddlePic,
      'original_pic': instance.originalPic,
      'is_paid': instance.paid,
      'mblog_vip_type': instance.mblogVipType,
      'user': instance.user,
      'retweeted_status': instance.retweetedStatus,
      'reposts_count': instance.repostsCount,
      'comments_count': instance.commentsCount,
      'attitudes_count': instance.attitudesCount,
      'pending_approval_count': instance.pendingApprovalCount,
      'isLongText': instance.isLongText,
      'reward_exhibition_type': instance.rewardExhibitionType,
      'reward_scheme': instance.rewardScheme,
      'hide_flag': instance.hideFlag,
      'mlevel': instance.mlevel,
      'visible': instance.visible,
      'biz_feature': instance.bizFature,
      'hasActionTypeCard': instance.hasActionTypeCard,
      'mblogtype': instance.mblogtype,
      'rid': instance.rid,
      'userType': instance.userType,
      'more_info_type': instance.moreInfoType,
      'cardid': instance.cardid,
      'number_display_strategy': instance.numberDisplayStrategy,
      'positive_recom_flag': instance.positiveRecomFlag,
      'content_auth': instance.contentAuth,
      'gif_ids': instance.gifIds,
      'is_show_bulletin': instance.isShowBulletin,
      'pic_num': instance.picNum,
    };

Pic _$PicFromJson(Map json) {
  return Pic()..thumbnailPic = json['thumbnail_pic'] as String;
}

Map<String, dynamic> _$PicToJson(Pic instance) => <String, dynamic>{
      'thumbnail_pic': instance.thumbnailPic,
    };

User _$UserFromJson(Map json) {
  return User()
    ..id = json['id'] as int
    ..idstr = json['idstr'] as String
    ..classId = json['class'] as int
    ..screenName = json['screen_name'] as String
    ..name = json['name'] as String
    ..province = json['province'] as String
    ..city = json['city'] as String
    ..location = json['location'] as String
    ..description = json['description'] as String
    ..url = json['url'] as String
    ..profileImageUrl = json['profile_image_url'] as String
    ..coverImage = json['cover_image'] as String
    ..coverImagePhone = json['cover_image_phone'] as String
    ..profileUrl = json['profile_url'] as String
    ..domain = json['domain'] as String
    ..weihao = json['weihao'] as String
    ..gender = json['gender'] as String
    ..followersCount = json['followers_count'] as int
    ..friendsCount = json['friends_count'] as int
    ..pagefriendsCount = json['pagefriends_count'] as int
    ..statusesCount = json['statuses_count'] as int
    ..videoStatusCount = json['video_status_count'] as int
    ..favouritesCount = json['favourites_count'] as int
    ..createdAt = json['created_at'] as String
    ..following = json['following'] as bool
    ..allowAllActMsg = json['allow_all_act_msg'] as bool
    ..geoEnabled = json['geo_enabled'] as bool
    ..verified = json['verified'] as bool
    ..verifiedType = json['verified_type'] as int
    ..remark = json['remark'] as String
    ..allowAllComment = json['allow_all_comment'] as bool
    ..avatarLarge = json['avatar_large'] as String
    ..avatarHd = json['avatar_hd'] as String
    ..verifiedReason = json['verified_reason'] as String
    ..verifiedTrade = json['verified_trade'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'idstr': instance.idstr,
      'class': instance.classId,
      'screen_name': instance.screenName,
      'name': instance.name,
      'province': instance.province,
      'city': instance.city,
      'location': instance.location,
      'description': instance.description,
      'url': instance.url,
      'profile_image_url': instance.profileImageUrl,
      'cover_image': instance.coverImage,
      'cover_image_phone': instance.coverImagePhone,
      'profile_url': instance.profileUrl,
      'domain': instance.domain,
      'weihao': instance.weihao,
      'gender': instance.gender,
      'followers_count': instance.followersCount,
      'friends_count': instance.friendsCount,
      'pagefriends_count': instance.pagefriendsCount,
      'statuses_count': instance.statusesCount,
      'video_status_count': instance.videoStatusCount,
      'favourites_count': instance.favouritesCount,
      'created_at': instance.createdAt,
      'following': instance.following,
      'allow_all_act_msg': instance.allowAllActMsg,
      'geo_enabled': instance.geoEnabled,
      'verified': instance.verified,
      'verified_type': instance.verifiedType,
      'remark': instance.remark,
      'allow_all_comment': instance.allowAllComment,
      'avatar_large': instance.avatarLarge,
      'avatar_hd': instance.avatarHd,
      'verified_reason': instance.verifiedReason,
      'verified_trade': instance.verifiedTrade,
    };

Visible _$VisibleFromJson(Map json) {
  return Visible()
    ..type = json['type'] as int
    ..listId = json['list_id'] as int;
}

Map<String, dynamic> _$VisibleToJson(Visible instance) => <String, dynamic>{
      'type': instance.type,
      'list_id': instance.listId,
    };

DisplayStrategy _$DisplayStrategyFromJson(Map json) {
  return DisplayStrategy()
    ..applyScenarioFlag = json['list_id'] as int
    ..displayTextMinNumber = json['display_text_min_number'] as int
    ..displayText = json['display_text'] as String;
}

Map<String, dynamic> _$DisplayStrategyToJson(DisplayStrategy instance) =>
    <String, dynamic>{
      'list_id': instance.applyScenarioFlag,
      'display_text_min_number': instance.displayTextMinNumber,
      'display_text': instance.displayText,
    };
