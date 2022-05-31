import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
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

    return Column(
      children: const [
        Expanded(
          child: Center(child: Text('注文履歴がありません')),
        ),
      ],
    );
  }
}
