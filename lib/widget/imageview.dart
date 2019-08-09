import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageView extends StatelessWidget {
  final imgUrl;
  ImageView({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.cover,
    );
  }
}
