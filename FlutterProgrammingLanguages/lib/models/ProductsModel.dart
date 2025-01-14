// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:delivery_app/models/storeModel.dart';

ProductsModel productsFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? stock;
  int? categoryId;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  Stores? store;
  int productCount=1;

  ProductsModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.stock,
      this.categoryId,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.store
      });

  ProductsModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? price,
    int? stock,
    int? categoryId,
    int? storeId,
    String? createdAt,
    String? updatedAt,
  }) =>
      ProductsModel(
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
      );

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      price: json["price"],
      stock: json["stock"],
      categoryId: json["category_id"],
      storeId: json["store_id"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
     // store: Stores.fromJson(json['store'])
     );

    factory ProductsModel.fromJsonDetail(Map<String, dynamic> json) => ProductsModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      price: json["price"],
      stock: json["stock"],
      categoryId: json["category_id"],
      storeId: json["store_id"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      store: Stores.fromJson(json['store'])
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
        "created_at": createdAt,
        "updated_at": updatedAt,
       // "store": store,
      };
}
