import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_item.dart';

class ItemInfo extends StatelessWidget {
  final ShopItemModel item;

  const ItemInfo({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceHanSans-Bold',
          ),
        ),
        item.description != '' ? const SizedBox(height: 8) : Container(),
        item.description != ''
            ? Text(
                item.description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              )
            : Container(),
      ],
    );
  }
}
