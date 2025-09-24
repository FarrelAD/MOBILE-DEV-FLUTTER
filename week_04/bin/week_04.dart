import 'dart:io';
import 'package:week_04/practicum_1.dart';

void main() {
  print('Available practicum:');
  for (int i = 1; i <= 5; i++) {
    print('$i. Practicum');
  }

  stdout.write('Choose practicum: ');
  String? inputStr = stdin.readLineSync();

  if (inputStr == null) {
    print('No input received!');
    return;
  }

  int inputInt = int.parse(inputStr);

  switch (inputInt) {
    case 1: practicum1(); break;
    default: print('Practicum is not available!');
  }
}
