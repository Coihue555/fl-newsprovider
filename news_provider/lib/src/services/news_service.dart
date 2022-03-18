import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _baseUrl = 'https://newsapi.org/v2';
final _apiKey  =  '&apiKey=74679a0e1f104be8a045699682500b52';

class NewsService with ChangeNotifier{
  List<Article> headlines = [

  ];
  NewsService(){
    
    this.getTopHeadlines();

  }

  getTopHeadlines() async {
    final url = Uri.parse('$_baseUrl/top-headlines?country=ar$_apiKey');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll( newsResponse.articles);
    notifyListeners();
  }
}