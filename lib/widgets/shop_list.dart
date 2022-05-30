import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/style.dart';
import 'package:in_market_user_app/models/shop.dart';

class ShopList extends StatelessWidget {
  final ShopModel shop;
  final Function()? onTap;

  const ShopList({
    required this.shop,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBottomBorder,
      child: ListTile(
        title: Text(
          shop.name,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
