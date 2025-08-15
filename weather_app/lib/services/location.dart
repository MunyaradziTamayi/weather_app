import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class location{

   late double latitude;
   late double longitude;

  Future <void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }


      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permiss'
                'ions are permanently denied, we cannot request permissions.');
      }
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}