import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_item.dart';

class ItemCard extends StatelessWidget {
  final ShopModel shop;
  final ShopItemModel item;
  final Function()? onTap;

  const ItemCard({
    required this.shop,
    required this.item,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18 / 12,
              child: Image.network(
                'https://placehold.jp/300x200.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceHanSans-Bold',
                      ),
                    ),
                    shop.priceView == true
                        ? Text(
                            '¥ ${item.price}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SourceHanSans-Bold',
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
