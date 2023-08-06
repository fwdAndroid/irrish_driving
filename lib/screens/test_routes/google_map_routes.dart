import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWithRoutes extends StatefulWidget {
  @override
  _MapWithRoutesState createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  GoogleMapController? mapController;
  List<LatLng> _points = []; // List to store GeoPoints for the route
  Location _location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    checkLocationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Routes')),
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0), // Initial camera position
          zoom: 10.0, // Initial zoom level
        ),
        onMapCreated: (controller) {
          mapController = controller;
          _getGeoPoints(); // Fetch Firestore Geopoints and draw lines on map
        },
        polylines: {
          // Add the polyline to the map
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            width: 3,
            points: _points,
          ),
        },
      ),
    );
  }

  void _getGeoPoints() {
    // Replace 'your_firestore_collection' with your actual Firestore collection name
    FirebaseFirestore.instance.collection('centers').get().then(
      (querySnapshot) {
        for (var doc in querySnapshot.docs) {
          final geoPoint = doc.data();
          List<dynamic> points = geoPoint['geopoint'];
          final latlongPoints =
              points.map((e) => LatLng(e.latitude, e.longitude));
          setState(() {
            _points = latlongPoints.toList(); // Drawing all geopoints as a line
          });
        }

        // List<LatLng> points = [];
        // querySnapshot.docs.forEach((doc) {
        //   GeoPoint geoPoint = doc[
        //       'geopoint']; // Assuming the field in Firestore is named 'location'
        //   points.add(LatLng(geoPoint.latitude, geoPoint.longitude));
        // });
      },
    );
  }

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
}
