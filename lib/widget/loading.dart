import 'package:flutter/material.dart';

/// 通用 Loading 页面
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      )),
    );
  }
}
