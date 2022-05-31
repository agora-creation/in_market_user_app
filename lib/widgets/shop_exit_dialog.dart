import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/custom_text_button.dart';

class ShopExitDialog extends StatefulWidget {
  final AuthProvider authProvider;

  const ShopExitDialog({
    required this.authProvider,
    Key? key,
  }) : super(key: key);

  @override
  State<ShopExitDialog> createState() => _ShopExitDialogState();
}

class _ShopExitDialogState extends State<ShopExitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            '現在設定している注文する店舗を解除できます。よろしいですか？',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                labelText: 'キャンセル',
                backgroundColor: Colors.grey,
                onPressed: () => Navigator.pop(context),
              ),
              CustomTextButton(
                labelText: '解除する',
                backgroundColor: Colors.red,
                onPressed: () async {
                  await widget.authProvider.deleteShop();
                  if (!mounted) return;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
