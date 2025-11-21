import 'package:flutter/material.dart';
 
class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.length;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
