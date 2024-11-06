import 'package:flutter/material.dart';
import 'package:try_your_self/components/category_card.dart';
import 'package:try_your_self/models/category_model.dart';

class CategoryView extends StatelessWidget{
  CategoryView({super.key});
  final List<CategoryModel> categoryList = [
    const CategoryModel(
      categoryName: 'Business', 
      categoryImagePath: 'assets/business.jpeg'
    ),
    const CategoryModel(
      categoryName: 'Technology', 
      categoryImagePath: 'assets/tech.jpeg'
    ),
    const CategoryModel(
      categoryName: 'Health', 
      categoryImagePath: 'assets/health.jpeg'
    ),
    const CategoryModel(
      categoryName: 'Entertainment', 
      categoryImagePath: 'assets/entertainment.jpeg'
    ),
    const CategoryModel(
      categoryName: 'Science', 
      categoryImagePath: 'assets/science.jpeg'
    ),
    const CategoryModel(
      categoryName: 'Sports', 
      categoryImagePath: 'assets/sport.jpeg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index){
          return CategoryCard(model: categoryList[index]);
        }
      ),
    );
  }

}