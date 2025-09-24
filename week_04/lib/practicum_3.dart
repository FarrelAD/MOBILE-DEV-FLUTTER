void practicum3() {
  var gifts = {'first': 'partridge', 'second': 'turtledoves', 'fifth': 1};

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  print('\nValue of mhs1 and mhs2');
  print(mhs1);
  print(mhs2);

  print('\nValue of gifts:');
  print(gifts);

  print('\nValue of nobleGases:');
  print(nobleGases);


  // add new key-value to map variable
  gifts['third'] = 'pancake';
  nobleGases[36] = 'krypton';

  mhs1['satu'] = 'Agus';
  mhs2[1] = 'Arjuno';

  print('\nNew values: ');
  print(gifts);
  print(nobleGases);

  print(mhs1);
  print(mhs2);
}
