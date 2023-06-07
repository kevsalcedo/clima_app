import 'package:geolocator/geolocator.dart';

class Location {
  late double? latitude;
  late double? longitude;

  Location({this.latitude, this.longitude});

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 5),
      );
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }
}
