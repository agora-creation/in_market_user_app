import 'package:flutter/material.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/widgets/custom_text_form_field2.dart';
import 'package:in_market_user_app/widgets/error_dialog.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:provider/provider.dart';

class UserAddressScreen extends StatefulWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('お届け先の変更'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomTextFormField2(
            controller: authProvider.zipController,
            keyboardType: TextInputType.number,
            labelText: '郵便番号',
            iconData: Icons.location_on,
          ),
          const SizedBox(height: 8),
          CustomTextFormField2(
            controller: authProvider.addressController,
            keyboardType: TextInputType.streetAddress,
            labelText: '住所',
            iconData: Icons.map,
          ),
          const SizedBox(height: 8),
          CustomTextFormField2(
            controller: authProvider.telController,
            keyboardType: TextInputType.phone,
            labelText: '電話番号',
            iconData: Icons.phone,
          ),
          const SizedBox(height: 16),
          RoundLgButton(
            labelText: '変更内容を保存',
            labelColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            onPressed: () async {
              String? errorText = await authProvider.updateAddress();
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
