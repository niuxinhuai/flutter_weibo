import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/widget/image/borderAvatarImage.dart';

Widget buildView(List<User> users, Dispatch dispatch, ViewService viewService) {
  return SizedBox(
    width: double.infinity,
    height: 100,
    child: ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return _buildFirstHint(context);
        return _buildAvatar(users[index], context);
      },
    ),
  );
}

Widget _buildFirstHint(BuildContext context) {
  final width = MediaQuery.of(context).size.width / 5 -
      ((MediaQuery.of(context).size.width / 5) / 2.0) / 5.0;
  return Container(
    constraints: BoxConstraints(minWidth: width, maxWidth: width),
    padding: const EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
    child: Column(
      children: <Widget>[
        Container(
          width: width - 15.0,
          height: width - 15.0,
          decoration: BoxDecoration(
              color: GpColors.normalSubSubTextColor,
              border: Border.all(width: 2, color: GpColors.titleColor),
              borderRadius: BorderRadius.all(Radius.circular(width - 15.0))),
        ),
        _buildText('我的故事', context),
      ],
    ),
  );
}

Widget _buildAvatar(User user, BuildContext context) {
  final width = MediaQuery.of(context).size.width / 5 -
      ((MediaQuery.of(context).size.width / 5) / 2.0) / 5.0;
  return Container(
    constraints: BoxConstraints(minWidth: width, maxWidth: width),
    padding: const EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
    child: Column(
      children: <Widget>[
        Container(
          width: width - 15.0,
          height: width - 15.0,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: GpColors.titleColor),
              borderRadius: BorderRadius.all(Radius.circular(width - 15.0))),
          child: BorderAvatarImage(
            width: width - 13.0,
            height: width - 13.0,
            avatarUrl: user.profileImageUrl,
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.0)),
          ),
        ),
        _buildText(user.name, context),
      ],
    ),
  );
}

Widget _buildText(String text, BuildContext context) {
  return Expanded(
    child: Text(
      text,
      style: Theme.of(context).textTheme.overline,
      maxLines: 1,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
