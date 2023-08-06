import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irrish_driving/utils/permission.utils.dart';

class MapWithRoutes extends StatefulWidget {
  @override
  _MapWithRoutesState createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  GoogleMapController? mapController;
  List<LatLng> _points = []; // List to store GeoPoints for the route

  @override
  void initState() {
    super.initState();
    PermissionUtils().checkLocationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Centers Routes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.directions),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
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

          print(latlongPoints);
        }
      },
    );
  }
}
