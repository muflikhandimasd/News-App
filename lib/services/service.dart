import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app_new/models/news_berita.dart';

class Service {
  // Dijalanin nanti : Future
  Future<List<Article>?> getData() async {
    List<Article>? list;
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=ed9885670748417a84878d19f34ef35c";
    // await spy urut
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = data["articles"] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
    }

    return list;
  }
}
