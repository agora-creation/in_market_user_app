import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/cart.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/services/shop_order.dart';

class OrderProvider with ChangeNotifier {
  ShopOrderService orderService = ShopOrderService();

  Future<String?> create({
    ShopModel? shop,
    UserModel? user,
    List<CartModel>? cartList,
  }) async {
    String? errorText;
    if (shop == null) errorText = '注文に失敗しました。';
    if (user == null) errorText = '注文に失敗しました。';
    if (cartList == null) errorText = 'カートに商品がありません。';
    try {
      List<Map> newCartList = [];
      for (CartModel cart in cartList ?? []) {
        newCartList.add(cart.toMap());
      }
      String newId = orderService.newId(shop?.id);
      orderService.create({
        'id': newId,
        'shopId': shop?.id,
        'shopName': shop?.name,
        'userId': user?.id,
        'userName': user?.name,
        'cartList': newCartList,
        'zip': user?.zip,
        'address': user?.address,
        'tel': user?.tel,
        'status': 1,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      errorText = '注文に失敗しました。';
    }
    return errorText;
  }

  DateTime month = DateTime.now();
  List<DateTime> days = generateDays(DateTime.now());

  void changeMonth(DateTime value) {
    month = value;
    days = generateDays(month);
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? streamOrders({
    ShopModel? shop,
    UserModel? user,
  }) {
    Stream<QuerySnapshot<Map<String, dynamic>>>? ret;
    ret = FirebaseFirestore.instance
        .collection('shop')
        .doc(shop?.id ?? 'error')
        .collection('order')
        .where('userId', isEqualTo: user?.id ?? 'error')
        .orderBy('createdAt', descending: true)
        .snapshots();
    return ret;
  }
}
