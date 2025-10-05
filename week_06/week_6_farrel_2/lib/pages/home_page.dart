import 'package:flutter/material.dart';
import 'package:week_6_farrel_2/models/item.dart';

class HomePage extends StatelessWidget {
  final _items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            final item = _items[idx];
            return InkWell(
              onTap: () => Navigator.pushNamed(context, '/item'),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: Text(item.name)),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
