import 'package:climate/screens/location_screen.dart';

import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climate/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = "3e6796c8cc5cf69a8892a59e36cfd961";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getlocation();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric");

    var weatherdata = await networkHelper.getData();

    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationHome(
            locationWeather: weatherdata,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff002F3F),
            Color(0xff019273),
          ],
        )),
        child: const Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
