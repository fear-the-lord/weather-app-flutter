import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // Accuracy need not be high, because it drains battery.
    // High accuracy is needed mainly for navigation purposes.
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
    // We also need to permission to get access to the location from the user.
    // Geolocator now does it automatically.
  }

  void printValues() {
    print(latitude);
    print(longitude);
  }
}
