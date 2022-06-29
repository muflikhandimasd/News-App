import 'package:flutter/material.dart';
import 'package:news_app_new/models/news_berita.dart';
import 'package:news_app_new/pages/detail_news_page.dart';
import 'package:news_app_new/services/service.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final service = Service();
  @override
  Widget build(BuildContext context) {
    Widget listViewWidget(List<Article> articles) {
      return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: articles.length,
        itemBuilder: (context, position) {
          var article = articles[position];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailNewsPage(article: article)));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          article.urlToImage,
                          fit: BoxFit.fill,
                          width: 300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          article.title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 15),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 100,
                              child: Text(
                                article.author,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              article.publishedAt.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black87,
      ),
      body: FutureBuilder(
          future: service.getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? RefreshIndicator(
                    onRefresh: () async {
                      snapshot.data;
                    },
                    child: listViewWidget(snapshot.data as List<Article>))
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
