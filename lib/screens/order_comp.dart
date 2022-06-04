import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_market_user_app/helpers/style.dart';

class OrderCompScreen extends StatefulWidget {
  const OrderCompScreen({Key? key}) : super(key: key);

  @override
  State<OrderCompScreen> createState() => _OrderCompScreenState();
}

class _OrderCompScreenState extends State<OrderCompScreen> {
  void _init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            decoration: loginDecoration,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'THANK YOU！',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSans-Bold',
                      letterSpacing: 3,
                    ),
                  ),
                  Text(
                    'ご注文が完了しました！',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSans-Bold',
                    ),
                  ),
                  SizedBox(height: 24),
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'この画面は数秒後、自動で閉じます。',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
