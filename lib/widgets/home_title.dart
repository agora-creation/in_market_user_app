import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
