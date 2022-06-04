import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/cart.dart';
import 'package:in_market_user_app/widgets/circle_button.dart';
import 'package:in_market_user_app/widgets/quantity_sm_button.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  final Function()? removeOnTap;
  final Function()? addOnTap;
  final Function()? deleteOnTap;

  const CartCard({
    required this.cart,
    this.removeOnTap,
    this.addOnTap,
    this.deleteOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://placehold.jp/300x200.png',
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cart.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSans-Bold',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantitySmButton(
                        quantity: cart.quantity,
                        removeOnTap: removeOnTap,
                        addOnTap: addOnTap,
                      ),
                      CircleButton(
                        iconData: Icons.delete,
                        backgroundColor: Colors.red.shade400,
                        onPressed: deleteOnTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
