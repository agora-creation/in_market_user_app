import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';

class ItemProvider with ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>>? streamList({ShopModel? shop}) {
    Stream<QuerySnapshot<Map<String, dynamic>>>? ret;
    ret = FirebaseFirestore.instance
        .collection('shop')
        .doc(shop?.id ?? 'error')
        .collection('item')
        .orderBy('createdAt', descending: true)
        .snapshots();
    return ret;
  }
}
