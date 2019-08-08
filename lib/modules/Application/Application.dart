import 'package:flutter/material.dart';
import 'package:weibo_flutter/modules/Application/model.dart';

class Applicaiton extends StatefulWidget {
  @override
  _ApplicaitonState createState() => _ApplicaitonState();
}

class _ApplicaitonState extends State<Applicaiton>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        physics: NeverScrollableScrollPhysics(),
        children: ApplicationModel.tabControllers,
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: ApplicationModel.items,
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: onTap,
      ),
    );
  }

  void onTap(int tag) {
    _pageController.animateToPage(tag,
        duration: Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  void onPageChanged(int page) {
    setState(() {
      this._curIndex = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
