import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double? latitude;
  double? longitude;
  Future<void> getlocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
