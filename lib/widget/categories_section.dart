import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/categorieModel.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          category.imagePath,
          width: 90,
          height: 90,
        ),
        Center(
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 16, color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final List<Category> categories = [
    Category(
        imagePath: 'assets/image/categories1.png',
        title: 'Prescription\nMedicine'),
    Category(imagePath: 'assets/image/categories2.png', title: 'OTC\nMedicine'),
    Category(
        imagePath: 'assets/image/categories3.png', title: 'Health\nDevices'),
    Category(imagePath: 'assets/image/categories4.png', title: "Women's\nCare"),
    Category(imagePath: 'assets/image/categories5.png', title: 'Baby\nCare'),
    Category(imagePath: 'assets/image/categories4.png', title: "Mother\nCare"),
    Category(imagePath: 'assets/image/categories3.png', title: 'Pet\nCare'),
  ];

  CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
      child: Container(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryWidget(category: categories[index]),
            );
          },
        ),
      ),
    );
  }
}
