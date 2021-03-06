import 'dart:convert';

import 'package:hello_world/model/article.dart';
import 'package:http/http.dart' as http;

String apiKey = '9ff1140d20154dfbabd5caf9c9799728';
String baseUrl = 'https://newsapi.org/v2';

class News{

  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
    }else{
      throw Exception("Lu ga bisa load data");
    }
  }
  
  Future<List<Article>?> getNewsCategory(String category) async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data('articles') as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception('error bro ga bisa ngambil data');
    }
  }
}

