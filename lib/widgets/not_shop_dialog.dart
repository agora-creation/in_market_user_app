import 'package:flutter/material.dart';
import 'package:in_market_user_app/widgets/custom_text_button.dart';

class NotShopDialog extends StatelessWidget {
  const NotShopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'まず初めに、注文する店舗をこのアプリに設定してください。',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const Text(
            '設定できる店舗は一つだけです。',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '店舗を選択する',
                backgroundColor: Colors.blue,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
