import 'package:flutter/material.dart';
import 'package:in_market_user_app/services/shop_order.dart';

class OrderProvider with ChangeNotifier {
  ShopOrderService orderService = ShopOrderService();

  int quantityController = 1;

  void clearController() {
    quantityController = 1;
  }

  void addQuantity() {
    quantityController += 1;
    notifyListeners();
  }

  void removeQuantity() {
    if (quantityController > 0) {
      quantityController -= 1;
    }
    notifyListeners();
  }
}
