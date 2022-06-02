import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/cart.dart';

class CartButton extends StatelessWidget {
  final List<CartModel> cartList;
  final Function()? onPressed;

  const CartButton({
    required this.cartList,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cartCount = 0;
    for (CartModel cart in cartList) {
      cartCount += cart.quantity;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: cartCount == 0 ? () {} : onPressed,
        icon: cartCount == 0
            ? const Icon(Icons.remove_shopping_cart)
            : Badge(
                position: BadgePosition.topEnd(top: -14, end: -8),
                badgeColor: Colors.red.shade400,
                badgeContent: Text(
                  '$cartCount',
                  style: const TextStyle(color: Colors.white),
                ),
                alignment: Alignment.topRight,
                child: Icon(Icons.shopping_cart, color: Colors.red.shade400),
              ),
      ),
    );
  }
}
