import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:week_13/models/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _pizzaString = '';
  List<Pizza> _myPizzas = [];
  int _appCounter = 0;

  Future<List<Pizza>> _readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizza-list.json');

    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    // setState(() {
    //   _pizzaString = myString;
    // });

    String json = _convertToJson(myPizzas);
    print(json);

    return myPizzas;
  }

  String _convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  Future<void> _readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _appCounter = prefs.getInt('appCounter') ?? 0;
    _appCounter++;

    await prefs.setInt('appCounter', _appCounter);

    setState(() {
      _appCounter = _appCounter;
    });
  }

  Future<void> _deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    setState(() {
      _appCounter = 0;
    });
  }

  @override
  void initState() {
    super.initState();

    // _readJsonFile().then((value) {
    //   setState(() {
    //     _myPizzas = value;
    //   });
    // });

    _readAndWritePreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('You have opened the app $_appCounter times'),
            ElevatedButton(
              onPressed: () {
                _readAndWritePreference();
              },
              child: const Text('Add counter'),
            ),
            ElevatedButton(
              onPressed: () {
                _deletePreference();
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}
