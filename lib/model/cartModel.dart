import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  double _price = 00;
  String _address = "Delivery to Choice Address";

  double get price => _price;
  String get address => _address;

  void updatePrice(double newPrice) {
    _price = newPrice;
    notifyListeners();
  }

  void updateAddress(String newAddress) {
    _address = newAddress;
    notifyListeners();
  }
}
