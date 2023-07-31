import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithRoutes extends StatefulWidget {
  @override
  _MapWithRoutesState createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  GoogleMapController? mapController;
  List<LatLng> _points = []; // List to store GeoPoints for the route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Routes')),
      body: GoogleMap(
        myLocationEnabled: true,
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
      (QuerySnapshot querySnapshot) {
        List<LatLng> points = [];
        querySnapshot.docs.forEach((doc) {
          GeoPoint geoPoint = doc[
              'geopoint']; // Assuming the field in Firestore is named 'location'
          points.add(LatLng(geoPoint.latitude, geoPoint.longitude));
        });

        setState(() {
          _points =
              points; // Update the points list to trigger a redraw of the map with lines
        });
      },
    );
  }
}
