import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  //* 返回当前时间戳 */
  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  static String getTimeDuration(String comTime) {
    var nowTime = DateTime.now();
    // Fri Aug 09 20:24:34 +0800 2019 // ddd MMM dd HH:mm:ss zzz yyyy
    var format = DateFormat('EEE MMM d HH:mm:ss Z yyyy', 'en_US');

    print('>>>>>>>date:$comTime');
    print('>>>>>>>>>>>${format.parse(comTime)}');
    var compareTime = DateTime.parse(comTime);
    if (nowTime.isAfter(compareTime)) {
      if (nowTime.year == compareTime.year) {
        if (nowTime.month == compareTime.month) {
          if (nowTime.day == compareTime.day) {
            if (nowTime.hour == compareTime.hour) {
              if (nowTime.minute == compareTime.minute) {
                return '片刻之间';
              }
              return (nowTime.minute - compareTime.minute).toString() + '分钟前';
            }
            return (nowTime.hour - compareTime.hour).toString() + '小时前';
          }
          return (nowTime.day - compareTime.day).toString() + '天前';
        }
        return (nowTime.month - compareTime.month).toString() + '月前';
      }
      return (nowTime.year - compareTime.year).toString() + '年前';
    }
    return 'time error';
  }
}
