import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/screens/regist.dart';
import 'package:in_market_user_app/widgets/custom_text_form_field.dart';
import 'package:in_market_user_app/widgets/link_button.dart';
import 'package:in_market_user_app/widgets/login_title.dart';
import 'package:in_market_user_app/widgets/round_lg_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.shade400,
            ),
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
                        '既に登録済みの方はログインしてください',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 16),
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
                      RoundLgButton(
                        labelText: 'ログイン',
                        labelColor: Colors.black54,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 60),
                      LinkButton(
                        labelText: '新規登録の場合はココをタップ！',
                        onTap: () {
                          nextScreen(context, const RegistScreen());
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
