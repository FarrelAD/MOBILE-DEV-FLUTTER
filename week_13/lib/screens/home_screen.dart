import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:week_13/models/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _pizzaString = '';
  List<Pizza> _myPizzas = [];
  int _appCounter = 0;

  String _documentsPath = '';
  String _tempPath = '';

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

  Future<void> _getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      _documentsPath = docDir.path;
      _tempPath = tempDir.path;
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

    // _readAndWritePreference();

    _getPaths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Documents path $_documentsPath'),
            Text('Temp path: $_tempPath')
          ],
        ),
      ),
    );
  }
}
