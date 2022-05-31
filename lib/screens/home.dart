import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/screens/cart.dart';
import 'package:in_market_user_app/screens/history.dart';
import 'package:in_market_user_app/screens/item.dart';
import 'package:in_market_user_app/screens/user.dart';
import 'package:in_market_user_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:in_market_user_app/widgets/home_title.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ShopModel? shop = authProvider.currentShop;
    List<Widget> tabs = [
      const ItemScreen(),
      const HistoryScreen(),
      const UserScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeTitle(
          authProvider: authProvider,
          shop: shop,
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
