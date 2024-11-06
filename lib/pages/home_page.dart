// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:try_your_self/components/app_title.dart';
import 'package:try_your_self/components/news_view_builder.dart';
import 'package:try_your_self/views/category_view.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: AppTitle(name: 'News'),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Latest News',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            const NewsViewBuilder(type: 'general'),
        
          ],
        ),
      ),

    );
  }
}
