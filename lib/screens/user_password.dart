import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/custom_text_form_field2.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class UserPasswordScreen extends StatefulWidget {
  const UserPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UserPasswordScreen> createState() => _UserPasswordScreenState();
}

class _UserPasswordScreenState extends State<UserPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomTextFormField2(
            controller: authProvider.passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            labelText: 'パスワード',
            iconData: Icons.lock,
          ),
          const SizedBox(height: 8),
          CustomTextFormField2(
            controller: authProvider.rePasswordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            labelText: 'パスワードの再入力',
            iconData: Icons.lock_outline,
          ),
          const SizedBox(height: 16),
          RoundLgButton(
            labelText: '変更内容を保存',
            labelColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            onPressed: () async {
              String? errorText = await authProvider.updatePassword();
              if (errorText != null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: errorText,
                  ),
                );
                return;
              }
              await authProvider.reloadUser();
              authProvider.clearController();
              if (!mounted) return;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
