import 'package:flutter/material.dart';
import 'package:week_6_farrel_1/widgets/title_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon), Text(label)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
        backgroundColor: Colors.white,
      ),
      body: const Column(children: [TitleSectionWidget()]),
    );
  }
}
