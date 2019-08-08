import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weibo_flutter/const/apiConst.dart';

class ServiceHelper {
  static Dio dio = Dio(Options(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      baseUrl: API.baseUrl,
      contentType: ContentType.parse(
          "application/x-www-form-urlencoded; charset=utf-8; application/json")));

  static Future<T> post<T>(
    String path, {
    data,
    Options options,
    CancelToken cancelToken,
    OnUploadProgress onSendProgress,
  }) {
    return dio
        .post<T>(path,
            options: options,
            data: data,
            cancelToken: cancelToken,
            onUploadProgress: onSendProgress)
        .then((value) => value.data);
  }

  static Future<T> get<T>(String path,
      {data, Options options, CancelToken cancelToken}) {
    return dio
        .get(path, options: options, data: data, cancelToken: cancelToken)
        .then((value) => value.data);
  }
}
