import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/bestsellModel.dart';
import 'package:pharmacy_task/model/cartModel.dart';
import 'package:pharmacy_task/model/discount_sale_model.dart';
import 'package:pharmacy_task/model/prescriptionModel.dart';
import 'package:pharmacy_task/widget/bestsell_section.dart';
import 'package:pharmacy_task/widget/categories_section.dart';
import 'package:pharmacy_task/widget/discount_sale_section.dart';
import 'package:pharmacy_task/widget/precription_section.dart';
import 'package:pharmacy_task/widget/search_section.dart';
import 'package:pharmacy_task/widget/slide_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<DiscountSaleModel> products = [
    DiscountSaleModel.fromJson({
      "name": "Systema Charcoal\nGuard Toothbrush",
      "image": "assets/image/sales1.png",
      "rating": 4.5,
      "original_price": 120,
      "discount_price": 108,
      "discount_percentage": 10,
      "reviews_count": 88,
      "product_url": "link_to_product_page"
    }),
    DiscountSaleModel.fromJson({
      "name": "Digital Blood\nPressure Machine",
      "image": "assets/image/sales2.png",
      "rating": 4.7,
      "original_price": 2610,
      "discount_price": 2008,
      "discount_percentage": 30,
      "reviews_count": 880,
      "product_url": "link_to_product_page"
    }),
    DiscountSaleModel.fromJson({
      "name": "Maxpro MUPS\nTablet 40 mg",
      "image": "assets/image/sales3.png",
      "rating": 4.5,
      "original_price": 120,
      "discount_price": 135,
      "discount_percentage": 10,
      "reviews_count": 88,
      "product_url": "link_to_product_page"
    }),
  ];
  final List<Bestsellmodel> bestproducts = [
    Bestsellmodel.fromJson({
      "name": "Napa",
      "power": "Tablet 500mg",
      "image": "assets/image/product1.png",
      "rating": 4.5,
      "original_price": 12,
      "discount_price": 10,
      "discount_percentage": 10,
      "reviews_count": 88,
      "product_url": "link_to_product_page"
    }),
    Bestsellmodel.fromJson({
      "name": "Sergel",
      "power": "Capsule 20mg",
      "image": "assets/image/product2.png",
      "rating": 4.7,
      "original_price": 70,
      "discount_price": 62,
      "discount_percentage": 30,
      "reviews_count": 88,
      "product_url": "link_to_product_page"
    }),
    Bestsellmodel.fromJson({
      "name": "Pantonix",
      "power": "Tablet 20mg",
      "image": "assets/image/product3.png",
      "rating": 4.5,
      "original_price": 108,
      "discount_price": 98,
      "discount_percentage": 10,
      "reviews_count": 88,
      "product_url": "link_to_product_page"
    }),
  ];
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
      body: SingleChildScrollView(
        child: Column(
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
            //MARK: Discount Section widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Image.asset('assets/icon/icon1.png', height: 30),
                      const SizedBox(width: 4),
                      const Text(
                        'Up to\n75% Off',
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: const Text('See All',
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.textColor))),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.61,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return DiscountSaleSection(product: products[index]);
                  },
                )
              ],
            ),
            //MARK: Best Selling Section widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      const Text('Best Selling Products',
                          style: TextStyle(fontSize: 24)),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: const Text('See All',
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.textColor))),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: bestproducts.length,
                  itemBuilder: (context, index) {
                    return BestsellSection(product: bestproducts[index]);
                  },
                )
              ],
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
