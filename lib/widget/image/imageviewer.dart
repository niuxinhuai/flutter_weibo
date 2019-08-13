import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/router/router.dart';
import 'package:weibo_flutter/utils/string.dart';
import 'package:weibo_flutter/widget/loading.dart';

class ImageViewer extends StatefulWidget {
  @required
  final List<String> picUrls;
  final String imageUrl;
  ImageViewer({this.picUrls, this.imageUrl});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  PageController _pageController;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _curIndex = widget.picUrls.indexOf(widget.imageUrl);
//    print('>>>>>>>下标是：${widget.picUrls.indexOf(widget.imageUrl)}');
    _pageController = PageController(initialPage: _curIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        String largeImageUrl =
            StringUtil.getLargeImageUrlString(widget.picUrls[index]);
        return GestureDetector(
          onTap: () => Router.pop(context),
          child: Container(
//        color: Colors.black,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Hero(
                tag: largeImageUrl,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: largeImageUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => new Loading(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: widget.picUrls.length,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
    );
  }
}
