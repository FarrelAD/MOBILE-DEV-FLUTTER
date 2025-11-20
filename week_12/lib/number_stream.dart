import 'dart:async';
import 'dart:math';

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  void close() {
    controller.close();
  }

  void addError() {
    controller.sink.addError('error');
  }

  Stream<int> getNumbers() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}