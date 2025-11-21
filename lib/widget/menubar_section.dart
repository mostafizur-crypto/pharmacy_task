import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';

class MenubarSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MenubarSection({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const barColor = AppColors.iconColor;

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: barColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _barItem("assets/icon/home.png", "Home", 0),
          _barItem("assets/icon/pharmacy.png", "Pharmacy", 1),
          _barItem("assets/icon/search.png", "Find Doctor", 2),
          _barItem("assets/icon/labtest.png", "Lab Test", 3),
          _barItem("assets/icon/menu.png", "Menu", 4),
        ],
      ),
    );
  }

  Widget _barItem(String icon, String title, int index) {
    bool isSelected = index == selectedIndex;

    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: isSelected
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  )
                : null,
            child: Column(
              children: [
                Image.asset(
                  icon,
                  height: 24,
                  width: 24,
                  color: isSelected ? AppColors.iconColor : Colors.white,
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? AppColors.iconColor : Colors.white,
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
