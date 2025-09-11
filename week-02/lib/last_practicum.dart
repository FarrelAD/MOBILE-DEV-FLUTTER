import 'dart:math';

/// Task: Create a program to display prime numbers from 0 to 201
/// If prime number found, display your full name with your NIM
void lastPracticum() {
  bool isPrime(int num) {
    if (num <= 1) return false;

    for (int i = 2; i <= sqrt(num).toInt(); i++) {
      if (num % i == 0) return false;
    }

    return true;
  }

  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print('Number: $i is a prime number');
      print('Farrel Augusta Dinata - 2341720081\n');
    }
  }
}