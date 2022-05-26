import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('注文する店舗を設定してください'));
    // final List<Map> shopItems = List.generate(
    //     100000,
    //     (index) => {
    //           'id': index,
    //           'name': '商品 $index',
    //           'image': 'https://placehold.jp/300x200.png',
    //         }).toList();
    //
    // return GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 8,
    //     crossAxisSpacing: 8,
    //   ),
    //   padding: const EdgeInsets.all(8),
    //   itemCount: shopItems.length,
    //   itemBuilder: (_, index) {
    //     return Container(
    //       alignment: Alignment.center,
    //       decoration: const BoxDecoration(
    //         color: Colors.white,
    //       ),
    //       child: Column(
    //         children: [
    //           Image.network(
    //             '${shopItems[index]['image']}',
    //             width: 300 / 2,
    //             height: 200 / 2,
    //             fit: BoxFit.cover,
    //           ),
    //           Text('${shopItems[index]['name']}'),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
