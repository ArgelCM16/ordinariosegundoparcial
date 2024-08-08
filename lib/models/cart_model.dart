import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (total, current) => total + current['price']);
}
