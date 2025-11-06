import 'package:flutter/material.dart';
import 'package:week_11/pages/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color _color = Colors.blue.shade700;

  Future _navigateAndGetColor(BuildContext context) async {
    _color = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    ) ?? 
      Colors.blue;
      
    setState(() {});
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(title: Text('Navigation First Screen - FAD')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateAndGetColor(context);
          },
          child: Text('Change color!')
        ),
      ),
    );
  }
}
