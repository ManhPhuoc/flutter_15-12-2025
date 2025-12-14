import 'package:flutter/services.dart';

class Product {
  late int id;
  late String title;
  late dynamic price;
  late String description;
  late String category;
  late String image;
  // Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['tile'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});
}
