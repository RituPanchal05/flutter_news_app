// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:the_news/models/Uk_news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class UkNewsRepository {
  Future<UkNewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    String url = "https://newsapi.org/v2/top-headlines?country=gb&apiKey=b9f52cdbebf94d72975b76907a581132";

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return UkNewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('ERROR');
  }
}
