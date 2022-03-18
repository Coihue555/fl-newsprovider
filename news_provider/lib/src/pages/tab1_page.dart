import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    

    return Scaffold(
      body: ListaNoticias(headlines)
    );
  }
}