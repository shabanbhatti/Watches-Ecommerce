import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Dark%20&%20Light%20theme/dark_light_theme.dart';
import 'package:watches_ecommerce_/First%20page/first_page_main.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: MyApp(),
      darkTheme: darkTheme,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(child: FirstPage()),
    );
  }
}
