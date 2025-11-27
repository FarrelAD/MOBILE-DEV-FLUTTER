import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week_13/models/pizza.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _pizzaString = '';
  List<Pizza> _myPizzas = [];

  Future<List<Pizza>> _readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
      .loadString('assets/pizza-list.json');

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

  @override
  void initState() {
    super.initState();

    _readJsonFile().then((value) {
      setState(() {
        _myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON'),),
      body: ListView.builder(
        itemCount: _myPizzas.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(_myPizzas[index].pizzaName),
          subtitle: Text(_myPizzas[index].description),
        );
      }),
    );
  }
}