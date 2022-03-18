import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index){ 
      return _Noticia( noticia: noticias[index], index: index,);
      },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    required this.noticia,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),

        _TarjetaTitulo( noticia ),

        _TarjetaImagen( noticia ),
      ],
    );
  }
}


class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Hello friend'),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo( this.noticia );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      child: Text(noticia.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${ index +1}. ', style: const TextStyle(color: Colors.indigo),),
          Text('${ noticia.source.name}. ')
        ]),
      
    );
  }
}