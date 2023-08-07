import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irrish_driving/utils/permission.utils.dart';
import 'package:geolocator/geolocator.dart';

class MapWithRoutes extends StatefulWidget {
  @override
  _MapWithRoutesState createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  GoogleMapController? mapController;
  List<LatLng> _points = []; // List to store GeoPoints for the route
  LatLng _currentLocation = LatLng(0.0, 0.0);
  CameraPosition cameraPosition =
      const CameraPosition(target: LatLng(51.1657, 10.4515));
  bool _isLoading = false;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    init();
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
        myLocationEnabled: true,
        indoorViewEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 5.0, // Initial zoom level
        ),
        markers: Set<Marker>.of(_markers), // Display the markers on the map
        onCameraMove: (CameraPosition cameraPositiona) {
          cameraPosition = cameraPositiona;
        },
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
            endCap: Cap.buttCap,
            startCap: Cap.squareCap,
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

  init() async {
    await getUserCurrentLocation().then((value) async {
      print("value.latitude:${value.latitude}");

      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);

      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition))
          .then((value) {
        print('animated');
      });
      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });
    await Geolocator.requestPermission().then((value) async {
      print(
          'getUserCurrentLocation:$value:${await Geolocator.getCurrentPosition()}');
    }).onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
}
