import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_item.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/item_image.dart';
import 'package:in_market_user_app/widgets/item_info.dart';
import 'package:in_market_user_app/widgets/quantity_lg_button.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatefulWidget {
  final ShopItemModel item;

  const ItemDetailScreen({required this.item, Key? key}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
          const ItemImage(),
          const SizedBox(height: 16),
          ItemInfo(item: widget.item),
          const SizedBox(height: 24),
          QuantityLgButton(
            item: widget.item,
            quantity: authProvider.quantity,
            removeOnTap: () => authProvider.removeQuantity(),
            addOnTap: () => authProvider.addQuantity(),
          ),
          const SizedBox(height: 8),
          RoundLgButton(
            labelText: 'カートに入れる',
            labelColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            onPressed: () async {
              String? errorText = await authProvider.addCart(item: widget.item);
              if (errorText != null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: errorText,
                  ),
                );
                return;
              }
              if (!mounted) return;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
