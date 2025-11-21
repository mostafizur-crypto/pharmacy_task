import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_task/home_page/home.dart';
import 'package:pharmacy_task/model/cartModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
