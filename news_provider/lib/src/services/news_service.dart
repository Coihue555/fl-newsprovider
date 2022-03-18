import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://newsapi.org/v2';
const _apiKey  =  '&apiKey=74679a0e1f104be8a045699682500b52';

class NewsService with ChangeNotifier{
  List<Article> headlines = [ ];

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.football, 'sports'),
    Category( FontAwesomeIcons.hospital, 'health'),
    Category( FontAwesomeIcons.gamepad, 'technology'),
  ];

  NewsService(){
    
    getTopHeadlines();

  }

  getTopHeadlines() async {
    final url = Uri.parse('$_baseUrl/top-headlines?country=ar$_apiKey');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll( newsResponse.articles);
    notifyListeners();
  }
}