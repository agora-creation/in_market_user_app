import 'package:flutter/material.dart';
import 'package:in_market_user_app/models/user.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int)? onTap;
  final int currentIndex;
  final UserModel? user;

  const CustomBottomNavigationBar({
    this.onTap,
    this.currentIndex = 0,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      fixedColor: Colors.red.shade400,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'SourceHanSans-Bold',
      ),
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.history_edu),
          label: '注文履歴',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: user?.name ?? '',
        ),
      ],
    );
  }
}
