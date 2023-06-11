import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Check_location extends ChangeNotifier {
  Position? positions;

  Future<void> getCurrentLocation() async {
    Position position = await determinePosition();
      positions = position;
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
