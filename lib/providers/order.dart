import 'package:flutter/material.dart';
import 'package:in_market_user_app/services/shop_order.dart';

class OrderProvider with ChangeNotifier {
  ShopOrderService orderService = ShopOrderService();
}
