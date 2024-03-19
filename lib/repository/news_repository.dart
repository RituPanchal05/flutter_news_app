// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:the_news/models/categories_news_model.dart';
import 'package:the_news/models/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=b9f52cdbebf94d72975b76907a581132";

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('ERROR');
  }

  Future<CategoriesNewsModel> fetchCategoriesNews(String category) async {
    String url = "https://newsapi.org/v2/everything?q=${category}&apiKey=b9f52cdbebf94d72975b76907a581132";

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('ERROR');
  }

}
