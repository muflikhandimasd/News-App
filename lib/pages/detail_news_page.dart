import 'package:flutter/material.dart';
import 'package:news_app_new/models/news_berita.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;
  const DetailNewsPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail News"),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.content),
            ),
            Text(article.publishedAt)
          ],
        ),
      ),
    );
  }
}
