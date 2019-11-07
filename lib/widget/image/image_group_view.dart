import 'package:flutter/cupertino.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/widget/image/imageview.dart';

class ImageGroupView extends StatelessWidget {
  final List<Pic> picList;

  ImageGroupView({this.picList});

  @override
  Widget build(BuildContext context) {
    List<Pic> picArray = [];
    if (picList == null || picList.length == 0) {
      return Container();
    } else if (picList.length > 9) {
      for (int i = 0; i < picList.length; ++i) {
        if (i > 8) {
          break;
        }
        picArray.add(picList[i]);
      }
    } else if (picList.length == 1) {
      return ImageView(
        imgUrl: picList[0].thumbnailPic,
        fit: BoxFit.scaleDown,
        picUrls: picList,
      );
    } else {
      for (int i = 0; i < picList.length; ++i) {
        picArray.add(picList[i]);
      }
    }
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: picArray.map((pic) {
        return _getImage(pic.thumbnailPic, picList);
      }).toList(),
    );
  }

  Widget _getImage(String picUrl, List<Pic> pics) {
    return ImageView(
      imgUrl: picUrl,
      fit: BoxFit.cover,
      picUrls: pics,
    );
  }
}
