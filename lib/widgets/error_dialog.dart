import 'package:flutter/material.dart';
import 'package:in_market_user_app/widgets/custom_text_button.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;

  const ErrorDialog({
    this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message ?? '',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '入力に戻る',
                backgroundColor: Colors.blue,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
