import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.asset('assets/vespa.jpg'),

          _buildTitleWidget(
            title: 'Awesome Vespa 🤩!!',
            location: 'Lowokwaru, Kota Malang',
            totalRating: 34,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(color, Icons.call, 'CALL'),
              _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
              _buildButtonColumn(color, Icons.share, 'SHARE'),
            ],
          ),

          Container(
            padding: const EdgeInsets.all(32),
            child: const Text(
              'Sebuah Vespa modern hadir dengan desain elegan yang memadukan gaya klasik ikonik dengan sentuhan teknologi masa kini. Garis bodi yang halus dan lampu LED futuristik memberikan kesan premium, sementara mesin bertenaga serta fitur-fitur canggih seperti panel digital membuat pengalaman berkendara semakin nyaman. Cocok untuk gaya hidup urban, Vespa modern bukan hanya sekadar kendaraan, tetapi juga simbol tren dan gaya hidup yang dinamis.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleWidget({
    required String title,
    required String location,
    int totalRating = 0,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),

          /* soal 3*/
          const Icon(Icons.star, color: Colors.red),
          Text('$totalRating'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
