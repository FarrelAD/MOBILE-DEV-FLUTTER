(T2, T1) _tukar<T1, T2>((T1, T2) record) {
  var (a, b) = record;
  return (b, a);
}

void practicum5() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var recordSimple = ('One', 'Two');
  var newRecordSimple = _tukar(recordSimple);

  print(recordSimple);
  print(newRecordSimple);

  // Step 4
  (String, int) mahasiswa = ('Farrel AD', 2341720081);
  print(mahasiswa);

  // Step 5
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
