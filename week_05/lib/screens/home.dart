import 'package:flutter/material.dart';
import 'package:hello_jti_polinema/widgets/my_image_widget.dart';
import 'package:hello_jti_polinema/widgets/my_text_widget.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({required this.title, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showAlertDialog(
    BuildContext context, {
    required String title,
    required String message,
    String actionButtonText = 'OK',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(actionButtonText),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyTextWidget(),
              const MyImageWidget(),
              const SizedBox(height: 32),
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 52),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showAlertDialog(
                    context,
                    title: 'My dialog',
                    message: 'This is the message!',
                  ),
                  child: const Text('Show an alert dialog!'),
                ),
              ),

              const SizedBox(height: 24),
              
              Text('Selected date: ${_selectedDate.toLocal().toString().split(' ')[0]}'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select date!'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(height: 50.0)),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
