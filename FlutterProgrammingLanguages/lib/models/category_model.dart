// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    int? id;
    String? name;

    Categories({
        this.id,
        this.name,
    });

    Categories copyWith({
        int? id,
        String? name,
    }) => 
        Categories(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
