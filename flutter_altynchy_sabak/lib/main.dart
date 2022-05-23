import 'package:flutter/material.dart';
import 'package:flutter_altynchy_sabak/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kurs3 Sabak6',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xff0A0E21)),
      home: HomePage(),
      // home: ResultScreen(),
    );
  }
}
