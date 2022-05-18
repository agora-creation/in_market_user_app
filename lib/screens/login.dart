import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  Column(
                    children: const [
                      Text(
                        'InMarket',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceHanSans-Bold',
                        ),
                      ),
                      Text(
                        '- 買う人用 -',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
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
                      TextFormField(
                        controller: email,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'メールアドレス',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 18,
                            color: Colors.black54,
                          ),
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          labelStyle: const TextStyle(color: Colors.black54),
                          focusColor: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: password,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'パスワード',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 18,
                            color: Colors.black54,
                          ),
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          labelStyle: const TextStyle(color: Colors.black54),
                          focusColor: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'ログイン',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SourceHanSans-Bold',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // child: Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const [
            //           Text(
            //             'InMarket',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 32,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: 'SourceHanSans-Bold',
            //             ),
            //           ),
            //           Text(
            //             '- 買う人用 -',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SpinKitPouringHourGlass(
            //         color: Colors.white,
            //         size: 40,
            //       )
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
