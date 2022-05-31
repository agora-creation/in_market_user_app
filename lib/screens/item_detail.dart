import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_item.dart';

class ItemDetailScreen extends StatefulWidget {
  final ShopItemModel item;

  const ItemDetailScreen({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.item.name),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
