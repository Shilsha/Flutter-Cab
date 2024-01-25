// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cab/viewpages/consts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class home_screen_1 extends StatefulWidget {
  final String sourceLocation;
  final String destinationLocation;
  final List<double> sourceCoordinates;
  final List<double> destinationCoordinates;

  const home_screen_1({
    Key? key,
    required this.sourceLocation,
    required this.destinationLocation,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
  }) : super(key: key);

  @override
  State<home_screen_1> createState() => _home_screen_1State();
}

class _home_screen_1State extends State<home_screen_1> {
  String googleApikey = GOOGLE_MAP_API_KEY;
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;

  String location = "Search Location";

  Set<Marker> markers = {};
  LatLng sourceLatLang = LatLng(0, 0);
  LatLng destinationLatLang = LatLng(0, 0);

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();

    sourceLatLang =
        LatLng(widget.sourceCoordinates[0], widget.sourceCoordinates[1]);
    destinationLatLang = LatLng(
        widget.destinationCoordinates[0], widget.destinationCoordinates[1]);
    location = widget.sourceLocation;
    _updateMarkers();
    _getPolyline();
  }

  void _updateMarkers() {
    markers.add(
      Marker(
        markerId: MarkerId("source_place"),
        position: sourceLatLang,
        infoWindow: InfoWindow(
            title: "${widget.sourceLocation}", snippet: 'Pick Up Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("destination_place"),
        position: destinationLatLang,
        infoWindow: InfoWindow(
            title: "${widget.destinationLocation}",
            snippet: 'Destination Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void _getPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApikey,
      PointLatLng(sourceLatLang.latitude, sourceLatLang.longitude),
      PointLatLng(destinationLatLang.latitude, destinationLatLang.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      polylines.add(
        Polyline(
          polylineId: PolylineId("poly"),
          color: Colors.blue,
          points: polylineCoordinates,
          width: 5,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: sourceLatLang,
          zoom: 12.0,
        ),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers,
        polylines: polylines,
      ),
    );
  }
}
