import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({super.key});

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color _color = Colors.blue.shade700;

  void _showColorDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question!'),
          content: const Text('Please choose a color:'),
          actions: [
            TextButton(
              onPressed: () {
                _color = Colors.red.shade700;
                Navigator.pop(context, _color);
              },
              child: const Text('RED'),
            ),
            TextButton(
              onPressed: () {
                _color = Colors.green.shade700;
                Navigator.pop(context, _color);
              },
              child: const Text('GREEN'),
            ),
            TextButton(
              onPressed: () {
                _color = Colors.blue.shade700;
                Navigator.pop(context, _color);
              },
              child: const Text('BLUE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(title: const Text('Navigation dialog screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showColorDialog(context);
          },
          child: const Text('Change color!'),
        ),
      ),
    );
  }
}
