import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithRoutes extends StatefulWidget {
  @override
  _MapWithRoutesState createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  late GoogleMapController mapController;
  List<LatLng> routePoints = []; // List to store GeoPoints for the route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Routes')),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
          _fetchRouteFromFirestore(); // Fetch GeoPoints from Firestore
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
              0, 0), // Set the initial camera position to a default location
          zoom: 12.0,
        ),
        polylines: _createPolylines(routePoints),
      ),
    );
  }

  void _fetchRouteFromFirestore() {
    // Replace 'YOUR_FIRESTORE_COLLECTION_NAME' with the actual collection name
    FirebaseFirestore.instance
        .collection('centers')
        .get()
        .then((querySnapshot) {
      List<LatLng> points = [];
      querySnapshot.docs.forEach((doc) {
        GeoPoint geoPoint = doc[
            'geopoint']; // Assuming you store GeoPoints under the 'location' field
        points.add(LatLng(geoPoint.latitude, geoPoint.longitude));
      });

      setState(() {
        routePoints = points;
        if (routePoints.isNotEmpty) {
          _moveCameraToRoute();
        }
      });
    });
  }

  void _moveCameraToRoute() {
    // Adjust camera position to fit the entire route
    LatLngBounds bounds = LatLngBounds(
      southwest: routePoints.reduce((value, element) => LatLng(
          value.latitude < element.latitude ? value.latitude : element.latitude,
          value.longitude < element.longitude
              ? value.longitude
              : element.longitude)),
      northeast: routePoints.reduce((value, element) => LatLng(
          value.latitude > element.latitude ? value.latitude : element.latitude,
          value.longitude > element.longitude
              ? value.longitude
              : element.longitude)),
    );

    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  Set<Polyline> _createPolylines(List<LatLng> points) {
    List<LatLng> polylinePoints =
        List.from(points); // Copy the list of GeoPoints

    return <Polyline>[
      Polyline(
        polylineId: PolylineId('route'),
        color: Colors.blue,
        width: 3,
        points: polylinePoints,
      ),
    ].toSet();
  }
}
