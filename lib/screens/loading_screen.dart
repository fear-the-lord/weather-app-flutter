import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // We need async function because getting location is a time consuming task and
  // we want it to happen in the background, so that the UI does not crash
  void getLocation() async {
    // Accuracy need not be high, because it drains battery.
    // High accuracy is needed mainly for navigation purposes.
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    print('Hello');
    // We also need to permission to get access to the location from the user.
    // Geolocator now does it automatically.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            print('Hello');
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
