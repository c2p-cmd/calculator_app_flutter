import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(const MainApp());

ThemeData _themeData() => ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xffbb86fc),
    primaryContainer: Color(0xff3700b3),
    secondary: Color(0xff03dac6),
    background: Color(0xff121212),
    surface: Color(0xff121212),
    error: Color(0xffcf6679),
    onPrimary: Color(0xff000000),
    onSecondary: Color(0xff000000),
    onBackground: Color(0xffffffff),
    onSurface: Color(0xffffffff),
    onError: Color(0xff000000),
    brightness: Brightness.light,
  )
);

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: true,
    theme: _themeData(),
    home: const HomePage(),
  );
}