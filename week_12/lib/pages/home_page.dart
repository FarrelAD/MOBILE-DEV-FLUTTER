import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:week_12/number_stream.dart';
import 'package:week_12/style/color_stream.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  late StreamTransformer transformer;

  late StreamSubscription subscription;

  late StreamSubscription subscription2;
  String values = '';

  void changeColor() async {
    // version 1
    // await for (var eventColor in colorStream.getColors()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }

    // version 2
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    // numberStream.addNumberToSink(myNum);

    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }

    // numberStream.addError();
  }

  void stopStream() {
    numberStreamController.close();
  }

  @override
  void initState() {
    super.initState();

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) => sink.add(value * 10),
      handleError: (error, trace, sink) => sink.add(-1),
      handleDone: (sink) => sink.close(),
    );

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    Stream stream = numberStreamController.stream.asBroadcastStream();
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });


    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone(() {
      print('onDone was called!');
    });

    // stream
    //     .transform(transformer)
    //     .listen((event) {
    //       setState(() {
    //         lastNumber = event;
    //       });
    //     })
    //     .onError((error) {
    //       setState(() {
    //         lastNumber = -1;
    //       });
    //     });

    // colorStream = ColorStream();
    // changeColor();
  }

  @override
  void dispose() {
    numberStreamController.close();
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream app')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New random number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop subscription!'),
            ),
          ],
        ),
      ),
    );
  }
}
