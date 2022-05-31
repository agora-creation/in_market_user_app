import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_item.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/providers/item.dart';
import 'package:in_market_user_app/screens/item_detail.dart';
import 'package:in_market_user_app/widgets/item_card.dart';
import 'package:in_market_user_app/widgets/shop_not_card.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final itemProvider = Provider.of<ItemProvider>(context);
    ShopModel? shop = authProvider.currentShop;
    List<ShopItemModel> items = [];

    return Column(
      children: [
        Expanded(
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
              if (shop == null) return ShopNotCard(authProvider: authProvider);
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
                  return ItemCard(
                    shop: shop,
                    item: item,
                    onTap: () => nextScreen(
                      context,
                      ItemDetailScreen(item: item),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
