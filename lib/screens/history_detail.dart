import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop_order.dart';
import 'package:in_market_user_app/providers/order.dart';
import 'package:in_market_user_app/widgets/cart_card2.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class HistoryDetailScreen extends StatefulWidget {
  final ShopOrderModel order;

  const HistoryDetailScreen({required this.order, Key? key}) : super(key: key);

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          const Text(
            '注文情報',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceHanSans-Bold',
            ),
          ),
          Text('注文元: ${widget.order.shopName}'),
          Text('注文日時: ${dateText('yyyy/MM/dd HH:mm', widget.order.createdAt)}'),
          Text('注文ステータス: ${widget.order.statusText()}'),
          const Divider(height: 24),
          const Text(
            '注文商品',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceHanSans-Bold',
            ),
          ),
          Column(
            children: widget.order.cartList.map((cart) {
              return CartCard2(cart: cart);
            }).toList(),
          ),
          const SizedBox(height: 24),
          widget.order.status == 1
              ? RoundLgButton(
                  labelText: 'キャンセルする',
                  labelColor: Colors.white,
                  backgroundColor: Colors.red.shade400,
                  onPressed: () async {
                    String? errorText = await orderProvider.cancel(
                      order: widget.order,
                    );
                    if (errorText != null) {
                      showDialog(
                        context: context,
                        builder: (_) => ErrorDialog(
                          message: errorText,
                        ),
                      );
                      return;
                    }
                    if (!mounted) return;
                    Navigator.pop(context);
                  },
                )
              : Container(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
