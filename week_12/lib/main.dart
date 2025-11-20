import 'package:flutter/material.dart';
import 'package:week_12/pages/new_home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const NewHomePage()
    );
  }
}
