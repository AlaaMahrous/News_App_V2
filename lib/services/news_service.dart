// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:try_your_self/models/news_model.dart';

class NewsService{
  NewsService({required this.dio});
  Dio dio;
  Future<List<NewsModel>> getNews(String category) async {
    try {
  Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=637a8e43414e4d4d8541bad0b8de7f8c&category=$category');
  Map<String, dynamic> jsonData = response.data;
  List<dynamic> article = jsonData["articles"];
  List<NewsModel> articlelist = [];
  for(var a in article){
    NewsModel obj = NewsModel.fromJson(a);
    if(obj.title != '[Removed]'){
    articlelist.add(obj);
    }
  }
  
  return articlelist;
  } on Exception catch (e) {
    return [];
  }

  }

}