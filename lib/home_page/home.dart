import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/bestsellModel.dart';
import 'package:pharmacy_task/model/cartModel.dart';
import 'package:pharmacy_task/model/discount_sale_model.dart';
import 'package:pharmacy_task/model/prescriptionModel.dart';
import 'package:pharmacy_task/widget/bestsale_section.dart';
import 'package:pharmacy_task/widget/cart_drawer.dart';
import 'package:pharmacy_task/widget/categories_section.dart';
import 'package:pharmacy_task/widget/discount_sale_section.dart';
import 'package:pharmacy_task/widget/menubar_section.dart';
import 'package:pharmacy_task/widget/precription_section.dart';
import 'package:pharmacy_task/widget/search_section.dart';
import 'package:pharmacy_task/widget/slide_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //MARK: Flash Sale jeson data
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
  //MARK: Best Sale jeson data
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
        leading: null,
        automaticallyImplyLeading: false,
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  '${cartModel.totalPrice} BDT',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const Expanded(
                              child: CartDrawer(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  const Icon(Icons.shopping_cart_outlined,
                      color: AppColors.iconColor, size: 30),
                  Positioned(
                    top: -5,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: AppColors.iconColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartModel.count}',
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.notifications_none,
                color: AppColors.iconColor, size: 30),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            //MARK: Search Slide Categories Section
            SearchWidget(
              controller: TextEditingController(),
              hintText: 'Search for "medicine"',
              onChanged: (text) {},
            ),
            const SlideSection(),
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
            PrecriptionSection(
              onUpload: (PrescriptionModel model) {
                jsonEncode(model.toJson());
              },
            ),
            //MARK: Flash Sale Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                fontSize: 18, color: AppColors.textColor)),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
            //MARK: Best Selling Products Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text('Best Selling Products',
                          style: TextStyle(fontSize: 24)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All',
                            style: TextStyle(
                                fontSize: 18, color: AppColors.textColor)),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: bestproducts.length,
                  itemBuilder: (context, index) {
                    return BestsaleSection(product: bestproducts[index]);
                  },
                )
              ],
            ),
          ],
        ),
      ),
      //Bottom Navigator BAr
      bottomNavigationBar: MenubarSection(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, "/home");
          } else if (index == 1) {
            return;
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, "/doctor");
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, "/labtest");
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, "/menu");
          }
        },
      ),
    );
  }
}
