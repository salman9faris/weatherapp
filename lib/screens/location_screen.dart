import 'package:climate/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationHome extends StatefulWidget {
  const LocationHome({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationHome> createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationHome> {
  WeatherModel weatherModel = WeatherModel();

  int? temprature;
  String? cityName;
  String? country;
  String? weatherIcon;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    double temp = weatherData['main']["temp"];
    temprature = temp.toInt();
    cityName = weatherData['name'];
    country = weatherData["sys"]["country"];
    var condition = weatherData["weather"][0]["id"];
    weatherIcon = weatherModel.getWeatherIcon(condition);
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
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),

              Center(
                child: const Text(
                  "Monday,Jan 19",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Center(
                child: Text(
                  "$cityName,$country",
                  style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),

              // const Icon(
              //   FontAwesomeIcons.cloudMoon,
              //   color: Colors.white,
              //   size: 150,
              // ),
              Center(
                child: Text(
                  weatherIcon.toString(),
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 80,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$temprature°",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 120,
                      fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(
                width: 20,
              ),
              cardWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(210, 1, 106, 116),
            Color.fromARGB(255, 1, 146, 115),
          ],
        ),
      ),
      child: Text("text"),
    );
  }
}
