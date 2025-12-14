import 'package:dio/dio.dart';
import 'package:list_view/models/list_product.dart';

class Api {
  Future<List<Product>> getAllShoes() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    try {
      var response = await dio.request(url);

      if (response.statusCode == 200) {
        List list = response.data;
        List<Product> listProduct = list
            .map((json) => Product.fromJson(json))
            .toList();
        print('Lay du lieu thanh cong : ${listProduct.length} san pham');
        return listProduct;
      } else {
        print('Loi API: Status : ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Loi ket noi  API:$e');
      return [];
    }
  }
}
