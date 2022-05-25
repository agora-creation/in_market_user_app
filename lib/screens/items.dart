import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> shopItems =
        List.generate(100000, (index) => {'id': index, 'name': '商品 $index'})
            .toList();

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: shopItems.length,
      itemBuilder: (_, index) {
        return Card(
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://hirome-sc.com/system/asset/item-images/0000000000101_1.jpg',
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Text('${shopItems[index]['name']}'),
          ),
        );
      },
    );
  }
}
