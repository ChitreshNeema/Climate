import 'package:geolocator/geolocator.dart';
class Location {
  double longitude=0;
  double latitude=0;

  Future<void> getCurrentLocation() async {
     try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print('location recieved');
      longitude = position.longitude;
      latitude = position.latitude;
      print('$longitude');
      print('$latitude');
    }
    catch (e) {
      print(e);
    }
  }
}
