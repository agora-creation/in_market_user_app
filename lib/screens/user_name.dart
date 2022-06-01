import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/custom_text_form_field2.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({Key? key}) : super(key: key);

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('名前の変更'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomTextFormField2(
            controller: authProvider.nameController,
            keyboardType: TextInputType.name,
            labelText: 'お名前',
            iconData: Icons.person,
          ),
          const SizedBox(height: 16),
          RoundLgButton(
            labelText: '変更内容を保存',
            labelColor: Colors.blue,
            borderColor: Colors.blue,
            onPressed: () async {
              String? errorText = await authProvider.updateName();
              if (errorText != null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: errorText,
                  ),
                );
                return;
              }
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
