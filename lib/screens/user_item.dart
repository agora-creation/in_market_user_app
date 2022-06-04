import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_item.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/providers/item.dart';
import 'package:in_market_user_app/widgets/custom_checkbox.dart';
import 'package:provider/provider.dart';

class UserItemScreen extends StatefulWidget {
  const UserItemScreen({Key? key}) : super(key: key);

  @override
  State<UserItemScreen> createState() => _UserItemScreenState();
}

class _UserItemScreenState extends State<UserItemScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    List<String> itemIds = user?.itemIds ?? [];
    ShopModel? shop = authProvider.currentShop;
    final itemProvider = Provider.of<ItemProvider>(context);
    List<ShopItemModel> items = [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('商品の表示設定'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: itemProvider.streamItems(shop: shop),
        builder: (context, snapshot) {
          items.clear();
          if (snapshot.hasData) {
            for (DocumentSnapshot<Map<String, dynamic>> doc
                in snapshot.data!.docs) {
              items.add(ShopItemModel.fromSnapshot(doc));
            }
          }
          if (items.isEmpty) return const Center(child: Text('商品がありません'));
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              ShopItemModel item = items[index];
              var contain = itemIds.where((e) => e == item.id);
              return CustomCheckbox(
                labelText: item.name,
                value: contain.isNotEmpty,
                onChanged: (value) => authProvider.updateItemIds(item: item),
              );
            },
          );
        },
      ),
    );
  }
}
