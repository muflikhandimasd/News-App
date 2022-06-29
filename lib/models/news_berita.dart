// To parse this JSON data, do
//
//     final berita = beritaFromJson(jsonString);

import 'dart:convert';

Berita beritaFromJson(String str) => Berita.fromJson(json.decode(str));

class Berita {
  Berita({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "Author tidak ada",
        title: json["title"] ?? "Title tidak ada",
        description: json["description"] ?? "Author tidak ada",
        url: json["url"] ?? "Gaada url",
        urlToImage: json["urlToImage"] ??
            "https://www.balitbangham.go.id/po-content/po-upload/news-default.jpg",
        publishedAt: json["publishedAt"] ?? "tidak ada",
        content: json["content"] ?? "Tidak Ada",
      );
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "Kosong",
        name: json["name"],
      );
}
