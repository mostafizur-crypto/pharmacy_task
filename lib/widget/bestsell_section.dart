import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/bestsellModel.dart';

class BestsellSection extends StatelessWidget {
  final Bestsellmodel product;

  const BestsellSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 190;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    product.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ), 
                const Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.buttonColor,
                    child: Text(
                      "9% Off",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  product.power,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 14),
                const SizedBox(width: 4),
                Text(
                  '${product.rating} (${product.reviewsCount} reviews)',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      Text(
                        '৳${product.originalPrice}',
                        style: const TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '৳${product.discountPrice}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      minimumSize: const Size(10, 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.buttonColor),
                  child: const Text(
                    'ADD',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
