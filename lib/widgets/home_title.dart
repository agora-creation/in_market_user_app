import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';

class HomeTitle extends StatelessWidget {
  final ShopModel? shop;
  final Function()? onTap;

  const HomeTitle({
    this.shop,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(shop?.name ?? '店舗未選択'),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
