import 'package:flutter/material.dart';

class UserEmailScreen extends StatefulWidget {
  const UserEmailScreen({Key? key}) : super(key: key);

  @override
  State<UserEmailScreen> createState() => _UserEmailScreenState();
}

class _UserEmailScreenState extends State<UserEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('メールアドレスの変更'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
