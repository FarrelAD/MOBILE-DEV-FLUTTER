import 'package:flutter/material.dart';
import 'package:week_6_farrel_2/pages/home_page.dart';
import 'package:week_6_farrel_2/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomePage(),
        '/item': (ctx) => const ItemPage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
