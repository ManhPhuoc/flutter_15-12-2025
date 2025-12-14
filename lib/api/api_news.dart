import 'package:dio/dio.dart';
import '../models/news.dart';

class Api {
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<List<Article>> getArticles() async {
    const apiKey = "e05925bd9fe049a9b299f981587ec5d6";
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

    try {
      final res = await dio.get(url);

      if (res.statusCode != 200) return [];

      final data = res.data;
      if (data == null || data["articles"] == null) return [];

      List list = data["articles"];
      return list.map((e) => Article.fromJson(e)).toList();
    } catch (e) {
      print("API error: $e");
      return [];
    }
  }
}
