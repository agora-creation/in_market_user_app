import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_item.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/providers/item.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final itemProvider = Provider.of<ItemProvider>(context);
    ShopModel? shop = authProvider.currentShop;
    List<ShopItemModel> items = [];

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: itemProvider.streamList(shop: shop),
        builder: (context, snapshot) {
          items.clear();
          if (snapshot.hasData) {
            for (DocumentSnapshot<Map<String, dynamic>> doc
                in snapshot.data!.docs) {
              items.add(ShopItemModel.fromSnapshot(doc));
            }
          }
          if (items.isEmpty) return const Center(child: Text('商品がありません'));
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (_, index) {
              ShopItemModel item = items[index];
              return Card(
                elevation: 3,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 12,
                      child: Image.network(
                        'https://placehold.jp/300x200.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceHanSans-Bold',
                              ),
                            ),
                            const Text(
                              '¥ 10',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceHanSans-Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
