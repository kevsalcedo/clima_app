import 'package:geolocator/geolocator.dart';

class Location {
  late double? latitude;
  late double? longitude;

  late LocationPermission permission;

  Future<void> requestPermission() async {
    permission = await Geolocator.requestPermission();
    print(permission);
  }

  Future<void> getCurrentLocation() async {
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 5),
        );
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    } else {
      print('Location permit denied');
    }
  }
}
