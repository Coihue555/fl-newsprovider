// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:news_provider/src/models/source_model.dart';

import 'enum_model.dart';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String? status;
    int? totalResults;
    List<Article> articles;

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    Source source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime publishedAt;
    String? content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author ?? '',
        "title": title,
        "description": description ?? '',
        "url": url,
        "urlToImage": urlToImage == '',
        "publishedAt": publishedAt.toIso8601String(),
        "content": content ?? '',
    };
}



enum Id { LA_NACION, INFOBAE, GOOGLE_NEWS }

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS,
    "infobae": Id.INFOBAE,
    "la-nacion": Id.LA_NACION
});

