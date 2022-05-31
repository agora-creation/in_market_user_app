import 'package:flutter/material.dart';

class UserItemScreen extends StatefulWidget {
  const UserItemScreen({Key? key}) : super(key: key);

  @override
  State<UserItemScreen> createState() => _UserItemScreenState();
}

class _UserItemScreenState extends State<UserItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('商品の表示設定'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
