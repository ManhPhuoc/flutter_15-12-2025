class Article {
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
