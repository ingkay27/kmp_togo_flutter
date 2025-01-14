import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;

class Helper {
  // Singleton
  Helper._internal();
  static final Helper _helper = Helper._internal();
  factory Helper() => _helper;

  // final _baseUrl = 'https://digitogo.tech';
  final _baseUrl = 'http://147.139.168.187:3000';

  late Dio _dio;
  Dio get dio => _dio;

  Future<void> init() async {
    final dir = await pathProvider.getApplicationDocumentsDirectory();
    final pathCookie = path.join(dir.path, '.cookies');

    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 15 * 1000, // 15 seconds
        receiveTimeout: 10 * 1000, // 10 seconds
        contentType: Headers.formUrlEncodedContentType));
    _dio.interceptors.add(
      CookieManager(
        PersistCookieJar(
          storage: FileStorage(pathCookie),
        ),
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }
}

class Error {
  String message;

  Error(this.message);
}
