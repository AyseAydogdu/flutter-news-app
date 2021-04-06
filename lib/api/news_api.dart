import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

import 'dart:convert';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&apiKey=32258dfe367e4349811e9ddab20abae1";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String id) async {
    //String id = category.id;
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=$id&apiKey=32258dfe367e4349811e9ddab20abae1";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}
