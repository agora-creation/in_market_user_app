import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/providers/auth.dart';
import 'package:in_market_user_app/screens/login.dart';
import 'package:in_market_user_app/screens/user_address.dart';
import 'package:in_market_user_app/screens/user_email.dart';
import 'package:in_market_user_app/screens/user_item.dart';
import 'package:in_market_user_app/screens/user_name.dart';
import 'package:in_market_user_app/screens/user_password.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';
import 'package:in_market_user_app/widgets/tap_list_tile.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 3,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TapListTile(
                    title: '名前の変更',
                    subtitle: user?.name,
                    onTap: () => nextScreen(context, const UserNameScreen()),
                  ),
                  TapListTile(
                    title: 'メールアドレスの変更',
                    subtitle: user?.email,
                    onTap: () => nextScreen(context, const UserEmailScreen()),
                  ),
                  TapListTile(
                    title: 'パスワードの変更',
                    onTap: () =>
                        nextScreen(context, const UserPasswordScreen()),
                  ),
                  TapListTile(
                    title: 'お届け先の登録',
                    onTap: () => nextScreen(context, const UserAddressScreen()),
                  ),
                  TapListTile(
                    title: '商品の表示設定',
                    onTap: () => nextScreen(context, const UserItemScreen()),
                  ),
                  const SizedBox(height: 24),
                  RoundLgButton(
                    labelText: 'ログアウト',
                    labelColor: Colors.redAccent,
                    borderColor: Colors.redAccent,
                    onPressed: () async {
                      await authProvider.logout();
                      if (!mounted) return;
                      changeScreen(context, const LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
