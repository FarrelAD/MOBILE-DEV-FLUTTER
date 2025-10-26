import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:week_09/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.camera, super.key});

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(title: 'Camera App Home', camera: camera),
    );
  }
}