import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/custom_text_button.dart';
import 'package:in_market_user_app/widgets/shop_select_dialog.dart';

class ShopNotCard extends StatelessWidget {
  final AuthProvider authProvider;

  const ShopNotCard({
    required this.authProvider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('注文する店舗をこのアプリに設定してください。'),
              const Text('設定できる店舗は一つだけです。'),
              const SizedBox(height: 24),
              CustomTextButton(
                labelText: '店舗を選択する',
                backgroundColor: Colors.blue,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ShopSelectDialog(
                      authProvider: authProvider,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
