import 'package:flutter/material.dart';
import 'api/api_news.dart';
import 'models/news.dart';
import 'screens/detail_screen.dart';

class ListOfArticle extends StatefulWidget {
  const ListOfArticle({super.key});

  @override
  State<ListOfArticle> createState() => _ListOfArticleState();
}

class _ListOfArticleState extends State<ListOfArticle> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = Api.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TIN TỨC NỔI BẬT",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(child: Text("Không có bài báo"));
          }

          final articles = snap.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, i) {
              final a = articles[i];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    a.urlToImage ?? "",
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(
                    a.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    a.description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(article: a),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
