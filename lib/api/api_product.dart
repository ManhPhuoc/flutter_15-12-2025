import 'package:dio/dio.dart';
import '/models/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      List list = response.data;
      return list.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi API');
    }
  }
}
