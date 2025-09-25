import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter itu mudah! Nama saya Farrel AD',
      style: TextStyle(color: Colors.red, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
