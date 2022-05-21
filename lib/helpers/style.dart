import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFEFFFA),
    fontFamily: 'SourceHanSans-Regular',
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFEFFFA),
      elevation: 5.0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
      ),
      iconTheme: IconThemeData(color: Colors.black54),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black54),
      bodyText2: TextStyle(color: Colors.black54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const BoxDecoration loginDecoration = BoxDecoration(
  color: Color(0xFFEF5350),
);

const TextStyle loginMessageStyle = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);