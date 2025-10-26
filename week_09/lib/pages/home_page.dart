import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:week_09/pages/filter_carousel.dart';
import 'package:week_09/pages/take_picture_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.camera});

  final String title;
  final CameraDescription camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Flutter Camera App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakePicturePage(camera: widget.camera),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Take Picture'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterCarousel(),
                  ),
                );
              },
              icon: const Icon(Icons.filter),
              label: const Text('Filter Carousel'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}