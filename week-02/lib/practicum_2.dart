import 'dart:io';

void practicum2() {
  stdout.write('Input counter: ');
  String? inputStr = stdin.readLineSync();

  if (inputStr == null) {
    print('No input received!');
    return;
  }

  int? counterParsed = int.tryParse(inputStr);

  if (counterParsed == null) {
    print('Counter is not integer!');
    return;
  }

  int counter = counterParsed;

  // while (counter < 33) {
  //   print(counter);
  //   counter++;
  // }

  do {
    print(counter);
    counter++;
  } while (counter < 77);
}
