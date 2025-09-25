import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingButtonCupertino extends StatelessWidget {
  const LoadingButtonCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: [
            CupertinoButton(child: const Text('My button'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
