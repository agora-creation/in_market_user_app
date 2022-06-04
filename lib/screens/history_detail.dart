import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/shop_order.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';

class HistoryDetailScreen extends StatefulWidget {
  final ShopOrderModel order;

  const HistoryDetailScreen({required this.order, Key? key}) : super(key: key);

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 8),
          RoundLgButton(
            labelText: 'キャンセルする',
            labelColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            onPressed: () async {
              if (!mounted) return;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
