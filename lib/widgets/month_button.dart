import 'package:flutter/material.dart';

class MonthButton extends StatelessWidget {
  final String? labelText;
  final Function()? onTap;

  const MonthButton({
    this.labelText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade400,
      child: ListTile(
        leading: const Icon(Icons.calendar_month, color: Colors.white),
        trailing: const Icon(Icons.arrow_drop_down, color: Colors.white),
        title:
            Text(labelText ?? '', style: const TextStyle(color: Colors.white)),
        onTap: onTap,
      ),
    );
  }
}
