import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
 late double lat;
 late double lon;


  @override
 void initState()  {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
   WeatherModel weatherModel=WeatherModel();
   var weatherData= await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData,);
    }
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitWaveSpinner(
          size: 64,
          color: Colors.green,
        ) ,
      ),
    );
  }
}
