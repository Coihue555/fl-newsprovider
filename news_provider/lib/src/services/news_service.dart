import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://newsapi.org/v2';
const _apiKey  =  '&apiKey=74679a0e1f104be8a045699682500b52';

class NewsService with ChangeNotifier{
  List<Article> headlines = [ ];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.football, 'sports'),
    Category( FontAwesomeIcons.hospital, 'health'),
    Category( FontAwesomeIcons.gamepad, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = List.empty(growable: true);
    });
  }

  dynamic get selectedCategory => _selectedCategory;
  set selectedCategory(dynamic valor){
    _selectedCategory = valor;

    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => categoryArticles[selectedCategory]!;

  getTopHeadlines() async {
    final url = Uri.parse('$_baseUrl/top-headlines?country=ar$_apiKey');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    headlines.addAll( newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory( String category) async {
    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final url = Uri.parse('$_baseUrl/top-headlines?country=ar$_apiKey&category=$category');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}