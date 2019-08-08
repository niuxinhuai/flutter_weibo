#!/usr/bin/env bash

#1. 将 iconfont.css , iconfont.ttf 拷贝到 flutter_weibo/fonts/目录下
#2. 运行此脚本

cd .. &&
cd fonts/ &&
python3 translate_icon_font_from_css_to_dart.py
# rm iconfont.css
# rm iconfont.ttf
mv iconfont.dart ../../lib/const/iconfont.dart
