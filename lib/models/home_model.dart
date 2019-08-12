import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

// https://open.weibo.com/wiki/常见返回对象数据结构#.E5.BE.AE.E5.8D.9A.EF.BC.88status.EF.BC.89
@JsonSerializable()
class HomeModel {
  @JsonKey(name: "has_unread")
  int hasUnread;
  @JsonKey(name: "max_id_str")
  String maxIdStr;
  @JsonKey(name: "max_id")
  int maxId;
  @JsonKey(name: "since_id_str")
  String sinceIdStr;
  @JsonKey(name: "since_id")
  int sinceId;
  @JsonKey(name: "uve_blank")
  int uveBlank;
  int interval;
  @JsonKey(name: "total_number")
  int totalNumber;
  @JsonKey(name: "next_cursor_str")
  String nextCursorStr;
  @JsonKey(name: "previous_cursor_str")
  String previousCursorStr;
  @JsonKey(name: "next_cursor")
  int nextCursor;
  @JsonKey(name: "previous_cursor")
  int previousCursor;
  bool hasvisible;
  @JsonKey(name: "statuses")
  List<Item> items;
  HomeModel();

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "created_at")
  String createdAt; // 微博创建时间
  int id;
  String idstr;
  String mid;
  @JsonKey(name: "can_edit")
  bool canEdit;
  @JsonKey(name: "show_additional_indication")
  int showAdd;
  String text; // 微博信息内容
  int textLength;
  @JsonKey(name: "source_allowclick")
  int allowClick;
  @JsonKey(name: "source_type")
  int sourceType;
  String source; // 微博来源
  bool favorited; // 是否已收藏，true：是，false：否
  bool truncated; // 是否被截断，true：是，false：否

  @JsonKey(name: "in_reply_to_status_id")
  String inReplyToStatusId;
  @JsonKey(name: "in_reply_to_user_id")
  String inReplyToUserId;
  @JsonKey(name: "in_reply_to_screen_name")
  String inReplyToScreenName;
  @JsonKey(name: "pic_urls")
  List<Pic> picUrls;
  @JsonKey(name: "thumbnail_pic")
  String thumbnailPic; // 缩略图片地址，没有时不返回此字段
  @JsonKey(name: "bmiddle_pic")
  String bmiddlePic; // 中等尺寸图片地址，没有时不返回此字段
  @JsonKey(name: "original_pic")
  String originalPic; // 原始图片地址，没有时不返回此字段
  @JsonKey(name: "is_paid")
  bool paid;
  @JsonKey(name: "mblog_vip_type")
  int mblogVipType;
  User user; // 微博作者的用户信息字段
  @JsonKey(name: "retweeted_status")
  Item retweetedStatus; // 被转发的原微博信息字段，当该微博为转发微博时返回
  @JsonKey(name: "reposts_count")
  int repostsCount; // 转发数
  @JsonKey(name: "comments_count")
  int commentsCount; // 评论数
  @JsonKey(name: "attitudes_count")
  int attitudesCount; // 表态数
  @JsonKey(name: "pending_approval_count")
  int pendingApprovalCount;
  bool isLongText;
  @JsonKey(name: "reward_exhibition_type")
  int rewardExhibitionType;
  @JsonKey(name: "reward_scheme")
  String rewardScheme;
  @JsonKey(name: "hide_flag")
  int hideFlag;
  int mlevel;
  Visible visible;
  @JsonKey(name: "biz_feature")
  int bizFature;
  int hasActionTypeCard;
  int mblogtype;
  String rid;
  int userType;
  @JsonKey(name: "more_info_type")
  int moreInfoType;
  String cardid;
  @JsonKey(name: "number_display_strategy")
  DisplayStrategy numberDisplayStrategy;
  @JsonKey(name: "positive_recom_flag")
  int positiveRecomFlag;
  @JsonKey(name: "content_auth")
  int contentAuth;
  @JsonKey(name: "gif_ids")
  String gifIds;
  @JsonKey(name: "is_show_bulletin")
  int isShowBulletin;
  @JsonKey(name: "pic_num")
  int picNum;

  Item();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Pic {
  @JsonKey(name: "thumbnail_pic")
  String thumbnailPic;
  Pic();

  factory Pic.fromJson(Map<String, dynamic> json) => _$PicFromJson(json);

  toJson() => _$PicToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String idstr;
  @JsonKey(name: "class")
  int classId;
  @JsonKey(name: "screen_name")
  String screenName;
  String name;
  String province;
  String city;
  String location;
  String description;
  String url;
  @JsonKey(name: "profile_image_url")
  String profileImageUrl;
  @JsonKey(name: "cover_image")
  String coverImage;
  @JsonKey(name: "cover_image_phone")
  String coverImagePhone;
  @JsonKey(name: "profile_url")
  String profileUrl;
  String domain;
  String weihao;
  String gender;
  @JsonKey(name: "followers_count")
  int followersCount; // 粉丝数
  @JsonKey(name: "friends_count")
  int friendsCount; // 关注数
  @JsonKey(name: "pagefriends_count")
  int pagefriendsCount;
  @JsonKey(name: "statuses_count")
  int statusesCount; // 微博数
  @JsonKey(name: "video_status_count")
  int videoStatusCount;
  @JsonKey(name: "favourites_count")
  int favouritesCount; // 收藏数
  @JsonKey(name: "created_at")
  String createdAt;
  bool following;
  @JsonKey(name: "allow_all_act_msg")
  bool allowAllActMsg;
  @JsonKey(name: "geo_enabled")
  bool geoEnabled;
  bool verified;
  @JsonKey(name: "verified_type")
  int verifiedType;
  String remark;
  @JsonKey(name: "allow_all_comment")
  bool allowAllComment;
  @JsonKey(name: "avatar_large")
  String avatarLarge;
  @JsonKey(name: "avatar_hd")
  String avatarHd;
  @JsonKey(name: "verified_reason")
  String verifiedReason;
  @JsonKey(name: "verified_trade")
  String verifiedTrade;
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Visible {
  int type;
  @JsonKey(name: "list_id")
  int listId;

  Visible();
  factory Visible.fromJson(Map<String, dynamic> json) =>
      _$VisibleFromJson(json);

  toJson() => _$VisibleToJson(this);
}

@JsonSerializable()
class DisplayStrategy {
  @JsonKey(name: "list_id")
  int applyScenarioFlag;
  @JsonKey(name: "display_text_min_number")
  int displayTextMinNumber;
  @JsonKey(name: "display_text")
  String displayText;
  DisplayStrategy();

  factory DisplayStrategy.fromJson(Map<String, dynamic> json) =>
      _$DisplayStrategyFromJson(json);

  toJson() => _$DisplayStrategyToJson(this);
}
