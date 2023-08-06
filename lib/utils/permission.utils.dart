import 'package:location/location.dart';

class PermissionUtils {
  Location _location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  Future<void> checkLocationPermissions() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        // Location service is still not enabled, handle the case accordingly
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Location permission is not granted, handle the case accordingly
        return;
      }
    }

    // Location service and permission are granted, get the user's location
    _locationData = await _location.getLocation();
    // Now you can use _locationData.latitude and _locationData.longitude to access user's location

    // Do additional tasks, like enabling the MyLocation layer on a map, etc.
  }
  //Get
}
