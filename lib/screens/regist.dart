import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_market_user_app/helpers/style.dart';
import 'package:in_market_user_app/widgets/custom_text_form_field.dart';
import 'package:in_market_user_app/widgets/icon_label.dart';
import 'package:in_market_user_app/widgets/link_button.dart';
import 'package:in_market_user_app/widgets/login_title.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            decoration: loginDecoration,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const LoginTitle(),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      const Text(
                        '登録がお済みでない方は新規登録してください',
                        style: loginMessageStyle,
                      ),
                      const SizedBox(height: 16),
                      const IconLabel(
                        iconData: Icons.key,
                        labelText: 'ログイン情報',
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'メールアドレス',
                        iconData: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'パスワード',
                        iconData: Icons.lock,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'パスワードの再入力',
                        iconData: Icons.lock_outline,
                      ),
                      const SizedBox(height: 32),
                      const IconLabel(
                        iconData: Icons.account_circle,
                        labelText: 'アカウント情報',
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        labelText: 'お名前',
                        iconData: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        labelText: '郵便番号',
                        iconData: Icons.location_on,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        labelText: '住所',
                        iconData: Icons.map,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        labelText: '電話番号',
                        iconData: Icons.phone,
                      ),
                      const SizedBox(height: 16),
                      RoundLgButton(
                        labelText: '新規登録',
                        labelColor: Colors.black54,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 60),
                      LinkButton(
                        labelText: 'ログインの場合はココをタップ！',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
