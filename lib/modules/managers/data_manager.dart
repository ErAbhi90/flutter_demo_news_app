import 'dart:convert';

import 'package:flutter_demo_news_app/modules/models/article.dart';
import 'package:http/http.dart';

class DataManager {
  final endPointUrl = Uri.parse(
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0da4bc923b204bd49fd575eadbfd9e66");

  Future<List<Article>> getArticles() async {
    Response res = await get(endPointUrl);
    if (res.statusCode == 200) {
      List json = jsonDecode(res.body)['articles'];

      List<Article> articles = json.map<Article>((item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
