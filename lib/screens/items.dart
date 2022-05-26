import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> shopItems = List.generate(
        100000,
        (index) => {
              'id': index,
              'name': '商品 $index',
              'image': 'https://placehold.jp/300x300.png',
            }).toList();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                '${shopItems[index]['image']}',
                fit: BoxFit.cover,
              ),
              Expanded(
                child: ListTile(
                  title: Text('${shopItems[index]['name']}'),
                  subtitle: Text('${shopItems[index]['name']}'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
