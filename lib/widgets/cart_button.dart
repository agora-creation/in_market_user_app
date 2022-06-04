import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int count;
  final Function()? onPressed;

  const CartButton({
    required this.count,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: count == 0 ? () {} : onPressed,
        icon: count == 0
            ? const Icon(Icons.remove_shopping_cart)
            : Badge(
                position: BadgePosition.topEnd(top: -14, end: -8),
                badgeColor: Colors.red.shade400,
                badgeContent: Text(
                  '$count',
                  style: const TextStyle(color: Colors.white),
                ),
                alignment: Alignment.topRight,
                child: Icon(Icons.shopping_cart, color: Colors.red.shade400),
              ),
      ),
    );
  }
}
