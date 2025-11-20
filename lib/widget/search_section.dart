import 'package:flutter/material.dart';
import 'package:pharmacy_task/color_section/color.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;

  SearchWidget({
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.textColor2),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textColor2,
            size: 25,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 18, color: AppColors.textColor2),
          iconColor: AppColors.textColor2,
          isDense: true,
        ),
      ),
    );
  }
}
