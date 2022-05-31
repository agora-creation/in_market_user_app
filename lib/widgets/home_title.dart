import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/shop_exit_dialog.dart';
import 'package:in_market_user_app/widgets/shop_select_dialog.dart';

class HomeTitle extends StatelessWidget {
  final AuthProvider authProvider;
  final ShopModel? shop;
  final Function()? onTap;

  const HomeTitle({
    required this.authProvider,
    this.shop,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (shop == null) {
          showDialog(
            context: context,
            builder: (_) => ShopSelectDialog(
              authProvider: authProvider,
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (_) => ShopExitDialog(
              authProvider: authProvider,
            ),
          );
        }
      },
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
