// https://newsapi.org/v2/top-headlines/sources?apiKey=3db1231bde42460fbb4c67dd9f8274cd


import 'dart:convert';
import 'dart:math';

import "package:http/http.dart";
import 'package:news_application_mvc/model/newsArt.dart';

class FetchNews {

  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {

    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print("Hello Rahul");
    print(sourceID);

    Response response = await get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=3db1231bde42460fbb4c67dd9f8274cd"
    ));

    print(response.body);
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    print("Hello");
    print(articles);

  print("*****************************************");
    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];
    print("Rahul");
    print(myArticle);
  print("*****************************************");


  return NewsArt.fromAPItoApp(myArticle);

  }
}