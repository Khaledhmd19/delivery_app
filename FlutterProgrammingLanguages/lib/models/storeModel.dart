// To parse this JSON data, do
//
//     final stores = storesFromJson(jsonString);

import 'dart:convert';

Stores storesFromJson(String str) => Stores.fromJson(json.decode(str));

String storesToJson(Stores data) => json.encode(data.toJson());

class Stores {
    int? id;
    String? title;
    String? description;
    dynamic image;
    String? location;
    String? createdAt;
    String? updatedAt;

    Stores({
        this.id,
        this.title,
        this.description,
        this.image,
        this.location,
        this.createdAt,
        this.updatedAt,
    });

    Stores copyWith({
        int? id,
        String? title,
        String? description,
        dynamic image,
        String? location,
        String? createdAt,
        String? updatedAt,
    }) => 
        Stores(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            image: image ?? this.image,
            location: location ?? this.location,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Stores.fromJson(Map<String, dynamic> json) => Stores(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        location: json["location"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "location": location,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
