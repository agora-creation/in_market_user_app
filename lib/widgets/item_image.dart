import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        'https://placehold.jp/300x200.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
