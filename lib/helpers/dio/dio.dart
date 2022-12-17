import 'package:dio/dio.dart';

import '../constants.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = Constants.baseUrl;
  dio.options.connectTimeout = 20000;

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestBody: true,
      requestHeader: true,
    ),
  );
  return dio;
}
