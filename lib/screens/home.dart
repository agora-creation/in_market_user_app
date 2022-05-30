import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/screens/cart.dart';
import 'package:in_market_user_app/screens/history.dart';
import 'package:in_market_user_app/screens/items.dart';
import 'package:in_market_user_app/screens/user.dart';
import 'package:in_market_user_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:in_market_user_app/widgets/home_title.dart';
import 'package:in_market_user_app/widgets/shop_select_dialog.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const ItemsScreen(),
    const HistoryScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ShopModel? shop = authProvider.currentShop;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeTitle(
          shop: shop,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ShopSelectDialog(
                authProvider: authProvider,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => overlayScreen(context, const CartScreen()),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        currentIndex: currentIndex,
        user: user,
      ),
    );
  }
}
