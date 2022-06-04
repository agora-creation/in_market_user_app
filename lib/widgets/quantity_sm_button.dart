import 'package:flutter/material.dart';

class QuantitySmButton extends StatelessWidget {
  final int quantity;
  final Function()? removeOnTap;
  final Function()? addOnTap;

  const QuantitySmButton({
    required this.quantity,
    this.removeOnTap,
    this.addOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
              '数量: $quantity',
              style: TextStyle(
                color: Colors.red.shade400,
                fontSize: 14,
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
      ),
    );
  }
}
