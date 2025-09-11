import 'dart:io';
import 'package:week_02/practicum_1.dart';
import 'package:week_02/practicum_2.dart';
import 'package:week_02/practicum_3.dart';
import 'package:week_02/last_practicum.dart';

void main(List<String> arguments) {
  print('Available practicum:');
  for (int i = 1; i <= 4; i++) {
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
    case 2: practicum2(); break;
    case 3: practicum3(); break;
    case 4: lastPracticum(); break;
    default: print('Practicum is not available!');
  }
}
