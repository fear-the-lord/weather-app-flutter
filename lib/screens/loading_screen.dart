import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // We need async function because getting location is a time consuming task and
  // we want it to happen in the background, so that the UI does not crash
  void getLocationData() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  // A stateful widget has 3 states: initState(), build(), deactivate()
  // initState() gets called only once whenever the stateful widget is created.
  // build() gets called every time the widget is changed.
  // deactivate() gets called only once at the end whenever the widget gets destroyed.

  // We don't want to load the location every time. Its expensive. So to call it one when the app
  // is loaded, we place it inside the build method.
  @override
  void initState() {
    super.initState();
    // An exception may occur if:
    // 1. The user does not allow permission to get the location.
    // 2. The GPS could not be detected.
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              'Please wait while we fetch your location',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
