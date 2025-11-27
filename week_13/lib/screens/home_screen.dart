import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  late File _file;
  String _fileText = '';

  final _pwdController = TextEditingController();
  String _myPass = '';

  final _storage = const FlutterSecureStorage();
  final _myKey = 'myPass';

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

  Future<bool> _writeFile() async {
    try {
      await _file.writeAsString('Margherita, Capriciossa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _readFile() async {
    try {
      String fileContent = await _file.readAsString();
      setState(() {
        _fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _writeToSecureStorage() async {
    await _storage.write(key: _myKey, value: _pwdController.text);
  }

  Future<String> _readFromSecureStorage() async {
    String secret = await _storage.read(key: _myKey) ?? '';
    return secret;
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

    _getPaths().then((_) {
      _file = File('$_documentsPath/pizzas.txt');
      _writeFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: _pwdController),

            ElevatedButton(
              onPressed: () {
                _writeToSecureStorage();
              },
              child: const Text('Save value'),
            ),

            Text('My pass: $_myPass'),

            ElevatedButton(
              onPressed: () {
                _readFromSecureStorage().then((value) {
                  setState(() {
                    _myPass = value;
                  });
                });
              },
              child: const Text('Read from secure storage'),
            ),
          ],
        ),
      ),
    );
  }
}
