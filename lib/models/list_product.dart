class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    final rateValue = json['rate'];
    return Rating(
      rate: rateValue is int ? rateValue.toDouble() : rateValue as double,
      count: json['count'] as int,
    );
  }
}

class Product {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating, // BẮT BUỘC phải nhận rating
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final priceValue = json['price'];

    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',

      // Xử lý giá
      price: priceValue is int ? priceValue.toDouble() : priceValue as double,

      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',

      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );
  }
}
