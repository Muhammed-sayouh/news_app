import 'dart:developer';

import 'package:dio/dio.dart' as dio_package;
import 'package:news_app/helpers/constants.dart';

import '../helpers/dio/dio.dart';
import '../model/news_model.dart';

Future<List<Article>> getNews({bool egyptNews = true}) async {
  try {
    dio_package.Response response = await dio().get(
      egyptNews ? Constants.egyptNewsPath : Constants.bbcNewsPath,
    );
    return newsModelFromJson(response.data).articles;
  } catch (err) {
   rethrow;
   
  }
}
