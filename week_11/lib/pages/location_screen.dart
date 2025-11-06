import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _myPosition = '';

  Future<Position> _getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  void _loadPosition() async {
    final position = await _getPosition();

    setState(() {
      _myPosition =
          'Latitude: ${position.latitude.toString()} - Longitude: ${position.longitude.toString()}';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPosition();
  }

  @override
  Widget build(BuildContext context) {
    final myWidget = _myPosition == ''
        ? const CircularProgressIndicator()
        : Text('My location: $_myPosition');

    return Scaffold(
      appBar: AppBar(title: const Text('Current location')),
      body: Center(child: myWidget),
    );
  }
}
