import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/router/router.dart';
import 'package:weibo_flutter/widget/imageviewer.dart';

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
    var reImageUrl = imgUrl;
    if (imgUrl.contains('thumbnail')) {
      reImageUrl = imgUrl.replaceAll('thumbnail', 'large');
    }

    var bmiddleUrl = imgUrl;
    if (imgUrl.contains('thumbnail')) {
      bmiddleUrl = imgUrl.replaceAll('thumbnail', 'bmiddle');
    }
    return GestureDetector(
      onTap: () {
//        print('>>>>>>name: $imgUrl');
        Router.push(
            context,
            ImageViewer(
              picUrls: array,
              imageUrl: imgUrl,
            ));
      },
      child: SingleChildScrollView(
        child: Hero(
          tag: reImageUrl,
          child: CachedNetworkImage(
            imageUrl: reImageUrl,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
