import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  bool alert = false;

  Future<void> checkPermition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    print(permission);
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      if (permission == LocationPermission.denied) {
        LocationPermission permission = await Geolocator.requestPermission();
      } else {
        alert = true;
        print("true");
      }
    }
  }

  Future<void> getLocation() async {
    // checkPermition();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // checkPermition();
      print(position);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("alert");
      await checkPermition();
    }
  }
}
