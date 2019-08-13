import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/router/router.dart';
import 'package:weibo_flutter/utils/string.dart';
import 'package:weibo_flutter/widget/image/imageviewer.dart';

class ImageView extends StatelessWidget {
  final imgUrl;
  final List<Pic> picUrls;
  final BoxFit fit;
  ImageView({this.imgUrl, this.fit, this.picUrls});
  @override
  Widget build(BuildContext context) {
    List<String> array = [];
    for (var pic in picUrls) {
      array.add(pic.thumbnailPic);
    }
    final itemWidth = (MediaQuery.of(context).size.width - 30.0) / 3.0;
    final double minHeight = (picUrls.length >= 3) ? itemWidth : 0.0;
    final double maxHeight = (picUrls.length >= 3) ? itemWidth : 200.0;
    final double minWidth = (picUrls.length >= 3) ? itemWidth : 0.0;
    final double maxWidth = (picUrls.length >= 3)
        ? itemWidth
        : MediaQuery.of(context).size.width / 2;
//    print(
//        '?>>>>>>>>minHeight:$minHeight  maxHeight:$maxHeight minWidth:$minWidth maxWidth:$maxWidth count:${picUrls.length}');
    return GestureDetector(
      onTap: () {
        Router.push(
            context,
            ImageViewer(
              picUrls: array,
              imageUrl: imgUrl,
            ));
      },
      child: Container(
        constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Hero(
            tag: StringUtil.getLargeImageUrlString(imgUrl),
            child: _getChildImageView(maxHeight),
          ),
        ),
      ),
    );
  }

  Widget _getChildImageView(double maxHeight) {
    return picUrls.length >= 3
        ? CachedNetworkImage(
            imageUrl: StringUtil.getBmiddleImageUrlString(imgUrl),
            fit: fit,
            height: maxHeight,
          )
        : CachedNetworkImage(
            imageUrl: StringUtil.getBmiddleImageUrlString(imgUrl),
            fit: fit,
          );
  }
}
