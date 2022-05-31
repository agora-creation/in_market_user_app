import 'package:flutter/material.dart';

class UserPasswordScreen extends StatefulWidget {
  const UserPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UserPasswordScreen> createState() => _UserPasswordScreenState();
}

class _UserPasswordScreenState extends State<UserPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('パスワードの変更'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
