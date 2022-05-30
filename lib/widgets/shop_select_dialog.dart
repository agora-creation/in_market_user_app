import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/style.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/shop_list.dart';

class ShopSelectDialog extends StatefulWidget {
  final AuthProvider authProvider;

  const ShopSelectDialog({
    required this.authProvider,
    Key? key,
  }) : super(key: key);

  @override
  State<ShopSelectDialog> createState() => _ShopSelectDialogState();
}

class _ShopSelectDialogState extends State<ShopSelectDialog> {
  List<ShopModel> shops = [];

  void _init() async {
    List<ShopModel> tmpShops = await widget.authProvider.selectShops();
    if (mounted) {
      setState(() => shops = tmpShops);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '注文する店舗を選択',
        style: TextStyle(fontSize: 14),
      ),
      content: Container(
        width: double.maxFinite,
        height: 250,
        decoration: kTopBottomBorder,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: shops.length,
          itemBuilder: (_, index) {
            ShopModel shop = shops[index];
            return ShopList(
              shop: shop,
              onTap: () async {
                await widget.authProvider.updateShop(shop: shop);
                if (!mounted) return;
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
