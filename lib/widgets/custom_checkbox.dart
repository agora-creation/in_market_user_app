import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/style.dart';

class CustomCheckbox extends StatelessWidget {
  final String? labelText;
  final bool? value;
  final Function(bool?)? onChanged;

  const CustomCheckbox({
    this.labelText,
    this.value,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBottomBorder,
      child: CheckboxListTile(
        title: Text(labelText ?? ''),
        activeColor: Colors.red.shade400,
        controlAffinity: ListTileControlAffinity.leading,
        value: value ?? false,
        onChanged: onChanged,
      ),
    );
  }
}
