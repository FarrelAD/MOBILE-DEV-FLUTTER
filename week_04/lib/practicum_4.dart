void practicum4() {
  List<int?> list1 = [1, 2, 3];
  var list2 = [0, ...list1];

  print(list1);
  print(list2);
  print(list2.length);

  list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  var myIdentityList = ['Farrel AD', '2341720081'];
  List<String> newListIdentity = ['ABC', ...myIdentityList];

  print('newListIdentity value:');
  print(newListIdentity);

  // step 4
  bool promoActive = false;

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('Nav');
  print(nav);

  // step 5
  String login = 'XYZ';

  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print(nav2);

  // step 6
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
