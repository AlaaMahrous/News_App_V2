import 'package:flutter/material.dart';
import 'package:try_your_self/components/news_card.dart';
import 'package:try_your_self/models/news_model.dart';

class NewsView extends StatelessWidget{
  const NewsView({super.key, required this.model});
  final List<NewsModel> model;
  
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: model.length,
      itemBuilder: (context, index){
        return NewsCard(model: model[index]);
      }
    );
  }
}