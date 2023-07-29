// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithRoutes extends StatefulWidget {
  final List<LatLng> routePoints; // List of GeoPoints for the route

  MapWithRoutes(this.routePoints);

  @override
  State<MapWithRoutes> createState() => _MapWithRoutesState();
}

class _MapWithRoutesState extends State<MapWithRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Routes')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.routePoints[
              0], // Set the initial camera position to the first GeoPoint
          zoom: 12.0,
        ),
        markers: _createMarkers(widget.routePoints),
        polylines: _createPolylines(widget.routePoints),
      ),
    );
  }

  Set<Marker> _createMarkers(List<LatLng> points) {
    return points.map((point) {
      return Marker(markerId: MarkerId(point.toString()), position: point);
    }).toSet();
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
