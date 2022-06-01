import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_item.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              'https://placehold.jp/300x200.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceHanSans-Bold',
                ),
              ),
              const SizedBox(height: 4),
              Text(widget.item.description),
            ],
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 8),
          RoundLgButton(
            labelText: 'カートに入れる',
            labelColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}
