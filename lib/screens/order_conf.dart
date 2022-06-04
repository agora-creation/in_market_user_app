import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/cart.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/providers/order.dart';
import 'package:in_market_user_app/screens/order_comp.dart';
import 'package:in_market_user_app/widgets/cart_card2.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class OrderConfScreen extends StatefulWidget {
  const OrderConfScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfScreen> createState() => _OrderConfScreenState();
}

class _OrderConfScreenState extends State<OrderConfScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ShopModel? shop = authProvider.currentShop;
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('注文内容の確認'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
            },
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
                    return CartCard2(cart: cart);
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
                  labelText: '注文を確定する',
                  labelColor: Colors.white,
                  backgroundColor: Colors.red.shade400,
                  onPressed: () async {
                    List<CartModel> cartList = await authProvider.getCart();
                    String? errorText = await orderProvider.create(
                      shop: shop,
                      user: user,
                      cartList: cartList,
                    );
                    if (errorText != null) {
                      showDialog(
                        context: context,
                        builder: (_) => ErrorDialog(
                          message: errorText,
                        ),
                      );
                      return;
                    }
                    authProvider.clearCart();
                    if (!mounted) return;
                    nextScreen(context, const OrderCompScreen());
                  },
                ),
                const SizedBox(height: 8),
                RoundLgButton(
                  labelText: 'カートに戻る',
                  labelColor: Colors.red.shade400,
                  borderColor: Colors.red.shade400,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
