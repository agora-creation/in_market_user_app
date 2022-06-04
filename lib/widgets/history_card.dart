import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop_order.dart';

class HistoryCard extends StatelessWidget {
  final ShopOrderModel order;
  final Function()? onTap;

  const HistoryCard({
    required this.order,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String statusText = '';
    switch (order.status) {
      case 0:
        statusText = '配達済み';
        break;
      case 1:
        statusText = '受注待ち';
        break;
      case 2:
        statusText = '配達待ち';
        break;
      case 4:
        statusText = 'キャンセル';
        break;
      default:
        statusText = '受注待ち';
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateText('yyyy/MM/dd HH:mm', order.createdAt),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceHanSans-Bold',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: order.cartList.map((cart) {
                        return Text(
                          '${cart.name} ×${cart.quantity}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Chip(label: Text(statusText)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
