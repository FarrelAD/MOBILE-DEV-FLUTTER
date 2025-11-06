import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = '';

  Future<Response> _getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/RKegDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      _result = total.toString();
    });
  }

  late Completer _completer;

  Future getNumber() {
    _completer = Completer<int>();
    calculate();
    return _completer.future;
  }

  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    _completer.complete(42);
  }

  Future<void> calculate2() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      _completer.complete(42);
    } catch (e) {
      _completer.completeError({});
    }
  }

  void returnFG() {
    // option 1: using FutureGroup
    // FutureGroup<int> futureGroup = FutureGroup<int>();
    // futureGroup.add(returnOneAsync());
    // futureGroup.add(returnTwoAsync());
    // futureGroup.add(returnThreeAsync());
    // futureGroup.close();

    // option 2: using Future.wait()
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element; 
      }

      setState(() {
        _result = total.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the future')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() { });

                'hello!'.substring(start);
                _getData()
                .then((value) {
                  _result = value.body.toString().substring(0, 450);
                  setState(() { });

                })
                .catchError((error) {
                  _result = 'An error occurred!';
                  setState(() { });
                });
              }, 
              child: const Text('GO!')
            ),
            const Spacer(),
            Text(_result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
