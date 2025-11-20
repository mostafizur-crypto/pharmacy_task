import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/cartModel.dart';
import 'package:pharmacy_task/model/prescriptionModel.dart';
import 'package:pharmacy_task/widget/categories_section.dart';
import 'package:pharmacy_task/widget/precription_section.dart';
import 'package:pharmacy_task/widget/search_section.dart';
import 'package:pharmacy_task/widget/slide_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // final String jsonData = '''
  //   [
  //     {"title": "Slide 1", "color": "#F5A9B8"},
  //     {"title": "Slide 2", "color": "#B0E0E6"},
  //     {"title": "Slide 3", "color": "#F0E68C"}
  //   ]
  // ''';
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        title: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Text(
                  'Delivery to Choice Address',
                  style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${cartModel.price} BDT',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor)),
                ],
              ),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.shopping_cart_outlined,
                color: AppColors.iconColor, size: 30),
            const SizedBox(width: 6),
            const Icon(Icons.notifications_none,
                color: AppColors.iconColor, size: 30),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //MARK:Search widget
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SearchWidget(
              controller: TextEditingController(),
              hintText: 'Search for "medicine"',
              onChanged: (text) {},
            ),
          ),
          //MARK: Slide widget
          const SlideSection(),
          //MARK: Category widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Categories', style: TextStyle(fontSize: 24)),
              ),
              CategoriesSection(),
            ],
          ),
          //MARK: upload Prescription widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrecriptionSection(
                onUpload: (PrescriptionModel model) {
                  jsonEncode(model.toJson());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
