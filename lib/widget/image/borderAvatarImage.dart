import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';

class BorderAvatarImage extends StatelessWidget {
  @required
  final String avatarUrl;
  final double width;
  final double height;
  BorderAvatarImage({this.avatarUrl, this.width = 35, this.height = 35});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          border:
              Border.all(width: 1, color: GpColors.dialogCancelBtnTextColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.5),
        child: CachedNetworkImage(
          imageUrl: avatarUrl,
        ),
      ),
    );
  }
}
