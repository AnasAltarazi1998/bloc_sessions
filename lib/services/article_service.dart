import 'package:bloc_sessions/models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<ArticlesResponse> fetchArticles() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=tesla&from=2021-05-17&sortBy=publishedAt&apiKey=4ec2c58578c042d3a9786fa8822481d2'),
        headers: {'Content-Type': 'application/json;charset=utf-8'});
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['status'] == 'error') throw Exception('${data['message']}');
    ArticlesResponse articlesResponse =
        ArticlesResponse.fromJson(jsonDecode(response.body));
    return articlesResponse;
  }
}
