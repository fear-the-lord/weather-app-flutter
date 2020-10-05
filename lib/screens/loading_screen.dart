import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'a1172aad92083736570d7cc139b36b9b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  // We need async function because getting location is a time consuming task and
  // we want it to happen in the background, so that the UI does not crash
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    // units = metric means we will get the result in celcius.
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

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
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
