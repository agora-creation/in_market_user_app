import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_order.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/providers/order.dart';
import 'package:in_market_user_app/screens/history_detail.dart';
import 'package:in_market_user_app/widgets/history_card.dart';
import 'package:in_market_user_app/widgets/month_button.dart';
import 'package:in_market_user_app/widgets/shop_not_card.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ShopModel? shop = authProvider.currentShop;
    final orderProvider = Provider.of<OrderProvider>(context);
    List<ShopOrderModel> orders = [];

    return Column(
      children: [
        MonthButton(
          labelText: dateText('yyyy年MM月', orderProvider.month),
          onTap: () async {
            DateTime? selected = await customMonthPicker(
              context: context,
              initialDate: orderProvider.month,
            );
            if (selected == null) return;
            orderProvider.changeMonth(selected);
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: orderProvider.streamOrders(shop: shop, user: user),
            builder: (context, snapshot) {
              orders.clear();
              if (snapshot.hasData) {
                for (DocumentSnapshot<Map<String, dynamic>> doc
                    in snapshot.data!.docs) {
                  orders.add(ShopOrderModel.fromSnapshot(doc));
                }
              }
              if (shop == null) return ShopNotCard(authProvider: authProvider);
              if (orders.isEmpty) {
                return const Center(child: Text('注文履歴がありません'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: orders.length,
                itemBuilder: (_, index) {
                  ShopOrderModel order = orders[index];
                  return HistoryCard(
                    order: order,
                    onTap: () => nextScreen(
                      context,
                      HistoryDetailScreen(order: order),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
