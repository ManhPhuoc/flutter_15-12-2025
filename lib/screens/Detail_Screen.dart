import 'package:flutter/material.dart';
import '../models/news.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  String formatDate(String? date) {
    if (date == null) return "Unknown";
    final d = DateTime.tryParse(date);
    if (d == null) return "Unknown";
    return "${d.day}/${d.month}/${d.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết bài báo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Published: ${formatDate(article.publishedAt)}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 220,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              article.content ?? article.description ?? "No content available",
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
