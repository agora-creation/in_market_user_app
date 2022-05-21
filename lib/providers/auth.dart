import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String?> loginCheck() async {
    String? errorText;
    if (emailController.text.isEmpty) {
      errorText = 'メールアドレスを入力してください。';
    }
    if (passwordController.text.isEmpty) {
      errorText = 'パスワードを入力してください。';
    }

    return errorText;
  }

  void clearController() {
    emailController.text = '';
    passwordController.text = '';
  }
}
