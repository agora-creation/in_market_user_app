import 'package:flutter/material.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/not_shop_dialog.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const NotShopDialog(),
        ).then((value) {
          showDialog(
            context: context,
            builder: (_) => const ErrorDialog(
              message: '店舗',
            ),
          );
        });
      },
      child: Row(
        children: const [
          Text('店舗未設定'),
          SizedBox(width: 4),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
