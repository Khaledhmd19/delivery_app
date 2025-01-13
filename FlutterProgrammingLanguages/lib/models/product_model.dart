// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  String? description;
  dynamic image;
  int? price;
  int? stock;
  int? categoryId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Store? store;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.stock,
    required this.categoryId,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
    required this.store,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    dynamic image,
    int? price,
    int? stock,
    int? categoryId,
    int? storeId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Store? store,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        categoryId: categoryId ?? this.categoryId,
        storeId: storeId ?? this.storeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        store: store ?? this.store,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        stock: json["stock"],
        categoryId: json["category_id"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "stock": stock,
        "category_id": categoryId,
        "store_id": storeId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "store": store!.toJson(),
      };
}

class Store {
  int id;
  String title;
  String description;
  dynamic image;
  String location;
  DateTime createdAt;
  DateTime updatedAt;

  Store({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  Store copyWith({
    int? id,
    String? title,
    String? description,
    dynamic image,
    String? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Store(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        location: location ?? this.location,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
