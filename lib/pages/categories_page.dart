import 'package:flutter/material.dart';
import 'package:try_your_self/components/app_title.dart';
import 'package:try_your_self/components/news_view_builder.dart';

class CategoriesPage extends StatelessWidget{
  const CategoriesPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppTitle(name: '$type News'),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            NewsViewBuilder(type: type),
          ],
        ),
      ),
    );
  }

}