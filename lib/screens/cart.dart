import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/quantity_sm_button.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:in_market_user_app/widgets/round_sm_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('カート'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://placehold.jp/300x200.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('丸和皿'),
                          Row(
                            children: [
                              const QuantitySmButton(
                                quantity: 1,
                              ),
                              RoundSmButton(
                                labelText: '削除',
                                labelColor: Colors.white,
                                backgroundColor: Colors.red.shade400,
                                onPressed: () async {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RoundLgButton(
              labelText: '注文内容を確認',
              labelColor: Colors.white,
              backgroundColor: Colors.red.shade400,
              onPressed: () async {
                if (!mounted) return;
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RoundLgButton(
              labelText: 'カートのリセット',
              labelColor: Colors.red,
              borderColor: Colors.red.shade400,
              onPressed: () async {
                await authProvider.clearCart();
                if (!mounted) return;
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
