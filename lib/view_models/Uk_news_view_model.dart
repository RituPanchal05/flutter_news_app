// ignore_for_file: unused_import

import 'package:http/http.dart';
import 'package:the_news/models/Uk_news_channel_headlines_model.dart';
import 'package:the_news/models/news_channel_headlines_model.dart';
import 'package:the_news/repository/Uk_news_repository.dart';
import 'package:the_news/repository/news_repository.dart';

class UkNewsViewModel {
  final _rep = UkNewsRepository();

  Future<UkNewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    final response = await _rep.fetchNewsChannelHeadlinesApi();
    return response;
  }
}
