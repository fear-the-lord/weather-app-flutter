import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // We need async function because getting location is a time consuming task and
  // we want it to happen in the background, so that the UI does not crash
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    location.printValues();
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
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
