import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_item.dart';

class QuantityLgButton extends StatelessWidget {
  final ShopItemModel item;
  final int quantity;
  final Function()? removeOnTap;
  final Function()? addOnTap;

  const QuantityLgButton({
    required this.item,
    required this.quantity,
    this.removeOnTap,
    this.addOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade400),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: removeOnTap,
            icon: Icon(
              Icons.remove,
              color: Colors.red.shade400,
            ),
          ),
          Text(
            '数量:　$quantity ${item.unit}',
            style: TextStyle(
              color: Colors.red.shade400,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceHanSans-Bold',
            ),
          ),
          IconButton(
            onPressed: addOnTap,
            icon: Icon(
              Icons.add,
              color: Colors.red.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
