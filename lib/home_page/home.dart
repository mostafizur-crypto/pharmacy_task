import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/cartModel.dart';
import 'package:pharmacy_task/widget/search_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'Delivery to Choice Address',
                  style: TextStyle(fontSize: 15, color: AppColors.greyColor),
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
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SearchWidget(
              controller: TextEditingController(),
              hintText: 'Search for "medicine"',
              onChanged: (text) {},
            ),
          ),
        ],
      )),
    );
  }
}
