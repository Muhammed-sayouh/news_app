import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/services/news_services.dart';

class HomeViewModel with ChangeNotifier {
  List<Article> egyptArticles = [];
  List<Article> bbcArticles = [];

  bool loaderEgyptNews = false;
  bool loaderBBCNews = false;

  Future<void> fetchEgyptNews() async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    loaderEgyptNews = true;
    try {
      egyptArticles = await getNews();

      loaderEgyptNews = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchBBCNews() async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    loaderBBCNews = true;
    try {
      bbcArticles = await getNews(egyptNews: false);
      loaderBBCNews = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
