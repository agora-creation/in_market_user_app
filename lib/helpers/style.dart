import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.red.shade200,
    fontFamily: 'SourceHanSans-Regular',
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'SourceHanSans-Bold',
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
  fontSize: 14,
);

const BoxDecoration kTopBottomBorder = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFFBDBDBD)),
    bottom: BorderSide(color: Color(0xFFBDBDBD)),
  ),
);

const BoxDecoration kBottomBorder = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: Color(0xFFBDBDBD)),
  ),
);
