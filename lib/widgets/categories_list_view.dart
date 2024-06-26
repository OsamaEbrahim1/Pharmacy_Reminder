import 'package:flutter/material.dart';
import 'package:reminder_app/models/category_model.dart';
import 'package:reminder_app/widgets/category_card.dart';

class categoris_list_view extends StatelessWidget {
  const categoris_list_view({
    super.key,
  });

  final List<CategoryModel> Categories = const [
    CategoryModel(
        categoryName: "Pills",
        categoryPrecent: "20%",
        categoryImage: "images/pills.png"),
    CategoryModel(
        categoryName: "Injections",
        categoryPrecent: "15%",
        categoryImage: "images/injections.png"),
    CategoryModel(
        categoryName: "syrup",
        categoryPrecent: "30%",
        categoryImage: "images/syrup.png"),
    CategoryModel(
        categoryName: "other products",
        categoryPrecent: "40%",
        categoryImage: "images/others.png")
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: Categories[index],
          );
        },
      ),
    );
  }
}