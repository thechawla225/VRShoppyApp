import 'package:flutter/cupertino.dart';
import 'package:vrshoppy/products.dart';

class CartNotifier extends ChangeNotifier {
  List<Product> cart = [];

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
  }
}
