import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/colors.dart';

class FWAppBar extends StatefulWidget implements PreferredSizeWidget {
  FWAppBar({this.barHeight = 46.0, this.title, this.showGradient = false});

  final double barHeight;
  final Widget title;
  final bool showGradient;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(barHeight);

  @override
  _FWAppBarState createState() => _FWAppBarState();
}

class _FWAppBarState extends State<FWAppBar> {
  final Color gradientStart = Color(0xFF49A2FC);
  final Color gradientEnd = Color(0xFF2171F5);
  final Color normalColor =
      GpColors.appbarBackgroundColor; //GpColors.primary[0]
  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    if (widget.showGradient) {
      decoration = BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
                color: GpColors.appbarLineColor,
                width: 1.0,
                style: BorderStyle.solid),
          ),
          gradient: LinearGradient(
              colors: [gradientStart, gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight));
    } else {
      decoration = BoxDecoration(
        color: normalColor,
        border: BorderDirectional(
          bottom: BorderSide(
              color: GpColors.appbarLineColor,
              width: 1.0,
              style: BorderStyle.solid),
        ),
      );
    }

    return Container(
      decoration: decoration,
      child: SafeArea(
        top: true,
        child: Center(
          child: widget.title,
        ),
      ),
    );
  }
}
