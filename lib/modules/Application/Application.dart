import 'package:flutter/material.dart';
import 'package:weibo_flutter/const/apiConst.dart';
import 'package:weibo_flutter/const/sp_helper.dart';
import 'package:weibo_flutter/const/userDefault.dart';
import 'package:weibo_flutter/modules/Application/model.dart';
import 'package:weibo_flutter/modules/web/oauth.dart';
import 'package:weibo_flutter/service/service_manager.dart';

class Applicaiton extends StatefulWidget {
  @override
  _ApplicaitonState createState() => _ApplicaitonState();
}

class _ApplicaitonState extends State<Applicaiton>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  SpHelper sp;
  int _curIndex = 0;
  bool go = false;
  final String oauthUrl = API.getOauthUrl();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    getTokenState();
  }

  getTokenState() async {
    sp = await SpHelper.getInstance();
    setState(() {
      go = sp.showWBoo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return go
        ? Scaffold(
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
          )
        : WebPage(
            url: oauthUrl,
            title: '微博登录',
            valueChanged: _back,
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

  //* 授权code回调 */
  _back(String code) {
    ServiceManager.getAccessToken(code).then((models) {
      SpHelper.setString(models.accessToken, UserDefaults.TOKEN_KEY).then((b) {
        if (b) {
          setState(() {
            go = true;
          });
        }
      });
      SpHelper.setString(
          (models.expires * 10).toString(), UserDefaults.TOKEN_TIME_KEY);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
