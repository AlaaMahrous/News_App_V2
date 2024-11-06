import 'package:flutter/material.dart';
import 'package:try_your_self/models/category_model.dart';
import 'package:try_your_self/pages/categories_page.dart';

class CategoryCard extends StatelessWidget{
  const CategoryCard({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return CategoriesPage(type: model.categoryName);
          }));
        },
        child: Container(
          width: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.categoryImagePath),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              model.categoryName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),
            )
          ),
        ),
      ),
    );
  }
}