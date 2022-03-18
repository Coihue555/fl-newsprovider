import 'package:news_provider/src/models/news_models.dart';

class Source {
    Source({
        required this.id,
        required this.name,
    });

    Id? id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : idValues.map[json["id"]],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : idValues.reverse![id],
        "name": name,
    };
}