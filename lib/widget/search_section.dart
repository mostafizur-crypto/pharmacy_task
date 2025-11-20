import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;

  const SearchWidget({super.key, 
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.brown),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: InputBorder.none,
          icon: const Icon(
            Icons.search,
            color: Colors.brown,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.brown.withOpacity(0.5)),
        ),
      ),
    );
  }
}
