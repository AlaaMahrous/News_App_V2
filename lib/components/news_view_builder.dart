import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:try_your_self/models/news_model.dart';
import 'package:try_your_self/services/news_service.dart';
import 'package:try_your_self/views/news_view.dart';

class NewsViewBuilder extends StatefulWidget{
  const NewsViewBuilder({super.key, required this.type});
  final String type;

  @override
  State<NewsViewBuilder> createState() => _NewsViewBuilderState();
}

class _NewsViewBuilderState extends State<NewsViewBuilder> {
  late Future<List<NewsModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
      builder: (context, snapshot){
        if(snapshot.hasData && snapshot.data != null){
          return NewsView(model: snapshot.data!);
        }else if(snapshot.hasError){
          return const SliverToBoxAdapter(child: Text('Opps there is an Error, try later'));
        }else{
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator())
          );
        }

      }
    );
  }
}