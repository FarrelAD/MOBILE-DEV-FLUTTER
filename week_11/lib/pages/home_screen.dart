import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:week_11/pages/location_screen.dart';

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

  Future _returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future _handleError() async {
    try {
      await _returnError();
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    } finally {
      print('Complete!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the future'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // count();

                // getNumber().then((value) {
                //   setState(() {
                //     _result = value.toString();
                //   });
                // }).catchError((e) {
                //   _result = 'An error occurred!';
                // });

                // returnFG();

                // _returnError()
                // .then((value) {
                //   setState(() {
                //     _result = 'Success!';
                //   });
                // }).catchError((onError) {
                //   setState(() {
                //     _result = onError.toString();
                //   });
                // }).whenComplete(() => print('Complete!'));

                _handleError();
              },
              child: const Text('GO!'),
            ),
            const Spacer(),
            Text(_result),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const LocationScreen()),
                );
              },
              child: const Text('Go to location screen!'),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
