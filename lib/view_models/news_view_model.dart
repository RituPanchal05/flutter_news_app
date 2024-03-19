// ignore_for_file: unused_import

import 'package:http/http.dart';
import 'package:the_news/models/categories_news_model.dart';
import 'package:the_news/models/news_channel_headlines_model.dart';
import 'package:the_news/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    final response = await _rep.fetchNewsChannelHeadlinesApi();
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNews(String category) async {
    final response = await _rep.fetchCategoriesNews(category);
    return response;
  }
}
