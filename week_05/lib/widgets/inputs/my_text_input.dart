import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh text field!'),
        ),
        body: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama'
          ),
        ),
      ),
    );
  }
}