import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/cart.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/screens/order_conf.dart';
import 'package:in_market_user_app/widgets/cart_card.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
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
          Expanded(
            child: FutureBuilder<List<CartModel>>(
              future: authProvider.getCart(),
              builder: (context, snapshot) {
                List<CartModel> cartList = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartList.length,
                  itemBuilder: (_, index) {
                    CartModel cart = cartList[index];
                    return CartCard(
                      cart: cart,
                      removeOnTap: () {
                        authProvider.removeCartQuantity(cart: cart);
                      },
                      addOnTap: () {
                        authProvider.addCartQuantity(cart: cart);
                      },
                      deleteOnTap: () {
                        authProvider.deleteCart(cart: cart);
                        if (cartList.length == 1) {
                          if (!mounted) return;
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                RoundLgButton(
                  labelText: '注文内容を確認',
                  labelColor: Colors.white,
                  backgroundColor: Colors.red.shade400,
                  onPressed: () => nextScreen(context, const OrderConfScreen()),
                ),
                const SizedBox(height: 8),
                RoundLgButton(
                  labelText: 'カートのリセット',
                  labelColor: Colors.red.shade400,
                  borderColor: Colors.red.shade400,
                  onPressed: () async {
                    await authProvider.clearCart();
                    if (!mounted) return;
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
