// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:baarbo/constants.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import '../constants.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:geocoder/geocoder.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import '../screens/pill_positioned.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import '../components/map_pin_pill.dart';
// // import 'dart:async';
// // import 'package:geolocator/geolocator.dart';

// // import '../models/pin_pill_info.dart';

// // const kGoogleApiKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";

// // const double CAMERA_ZOOM = 10;
// // const double CAMERA_TILT = 0;
// // const double CAMERA_BEARING = 30;
// // const LatLng SOURCE_LOCATION = LatLng(25.4484, 78.5685);
// // const LatLng DEST_LOCATION = LatLng(26.4499, 80.3319);

// // class SearchStore extends StatefulWidget {
// //   static const routeName = '/Search';

// //   @override
// //   _SearchStoreState createState() => _SearchStoreState();
// // }

// // class _SearchStoreState extends State<SearchStore> {
// //   String inputaddr = '';
// //   GoogleMapController mapController;
// //   Set<Marker> _markers = {};
// //   Set<Polyline> _polylines = {};
// //   List<LatLng> polylineCoordinates = [];
// //   PolylinePoints polylinePoints = PolylinePoints();
// //   String googleAPIKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";
// //   BitmapDescriptor sourceIcon;
// //   BitmapDescriptor destinationIcon;
// //   double pinPillPosition = -100;
// //   bool pill = true;
// //   PinInformation currentlySelectedPin = PinInformation(
// //       pinPath: '',
// //       avatarPath: '',
// //       location: LatLng(0, 0),
// //       locationName: '',
// //       labelColor: Colors.grey);
// //   PinInformation sourcePinInfo;
// //   PinInformation destinationPinInfo;

// //   final Geolocator _geolocator = Geolocator();
// //   Position _currentPosition;

// //   @override
// //   void initState() {
// //     super.initState();
// //     setSourceAndDestinationIcons();
// //     _getCurrentLocation();
// //   }

// //   // Method for retrieving the current location
// //   _getCurrentLocation() async {
// //     await _geolocator
// //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// //         .then((Position position) async {
// //       setState(() {
// //         // Store the position in the variable
// //         _currentPosition = position;

// //         print('CURRENT POS: $_currentPosition');

// //         // For moving the camera to current location
// //         mapController.animateCamera(
// //           CameraUpdate.newCameraPosition(
// //             CameraPosition(
// //               target: LatLng(position.latitude, position.longitude),
// //               zoom: 18.0,
// //             ),
// //           ),
// //         );
// //       });
// //     }).catchError((e) {
// //       print(e);
// //     });
// //   }

// //   Widget setMapPins() {
// //     CameraPosition initialLocation = CameraPosition(
// //         zoom: CAMERA_ZOOM,
// //         bearing: CAMERA_BEARING,
// //         tilt: CAMERA_TILT,
// //         target: SOURCE_LOCATION);

// //     sourcePinInfo = PinInformation(
// //         locationName: "Start Location",
// //         location: SOURCE_LOCATION,
// //         pinPath: "assets/driving_pin.png",
// //         avatarPath: "assets/friend1.jpg",
// //         labelColor: Colors.blueAccent);

// //     _markers.add(Marker(
// //         markerId: MarkerId('sourcePin'),
// //         position: SOURCE_LOCATION,
// //         onTap: () {
// //           setState(() {
// //             pill = false;
// //             currentlySelectedPin = sourcePinInfo;
// //             pinPillPosition = 0;
// //           });
// //         },
// //         icon: sourceIcon));

// //     return StreamBuilder(
// //         stream: Firestore.instance.collection('shops').snapshots(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) return Text('Loading maps... Please Wait');
// //           for (int i = 0; i < snapshot.data.documents.length; i++) {
// //             print(snapshot.data.documents[i]);

// //             destinationPinInfo = PinInformation(
// //                 locationName: "End Location",
// //                 location: LatLng(snapshot.data.documents[i]['coords'].latitude,
// //                     snapshot.data.documents[i]['coords'].longitude),
// //                 pinPath: "assets/destination_map_marker.png",
// //                 avatarPath: "assets/friend2.jpg",
// //                 labelColor: Colors.purple);

// //             _markers.add(Marker(
// //                 markerId: MarkerId(snapshot.data.documents[i]['Id'].toString()),
// //                 position: LatLng(snapshot.data.documents[i]['coords'].latitude,
// //                     snapshot.data.documents[i]['coords'].longitude),
// //                 onTap: () {
// //                   setState(() {
// //                     pill = false;
// //                     currentlySelectedPin = destinationPinInfo;
// //                     pinPillPosition = 0;
// //                   });
// //                 },
// //                 icon: destinationIcon));

// //             print(
// //                 '77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777');
// //             setPolylines(snapshot.data.documents[i]['coords'].latitude,
// //                 snapshot.data.documents[i]['coords'].longitude);
// //           }
// //           print(
// //               '9999999999999999999999999999999999999999999999999999999999999999999999999999999999');

// //           return GoogleMap(
// //             myLocationEnabled: true,
// //             compassEnabled: true,
// //             tiltGesturesEnabled: false,
// //             markers: _markers,
// //             polylines: _polylines,
// //             initialCameraPosition: initialLocation,
// //             myLocationButtonEnabled: false,
// //             mapType: MapType.normal,
// //             zoomGesturesEnabled: true,
// //             zoomControlsEnabled: false,
// //             onMapCreated: onMapCreated,
// //             // onMapCreated: onMapCreated,
// //             onTap: (LatLng location) {
// //               setState(() {
// //                 pinPillPosition = -100;
// //                 pill = true;
// //               });
// //             },
// //           );
// //         });
// //   }

// //   setPolylines(l1, l2) async {
// //     List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
// //         googleAPIKey,
// //         SOURCE_LOCATION.latitude,
// //         SOURCE_LOCATION.longitude,
// //         l1,
// //         l2);
// //     print(
// //         '555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555');

// //     if (result.isNotEmpty) {
// //       print('______________________________________00000000000000000000000000');
// //       result.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });

// //       setState(() {
// //         Polyline polyline = Polyline(
// //             polylineId: PolylineId("poly"),
// //             width: 2,
// //             color: Color.fromARGB(255, 40, 122, 198),
// //             points: polylineCoordinates);
// //         _polylines.add(polyline);
// //         print('______________________________________88888888888888888');
// //       });
// //     }
// //   }

// //   addToList() async {
// //     final query = inputaddr;
// //     var addresses = await (Geocoder.local.findAddressesFromQuery)(query);
// //     var first = addresses.first;
// //     Firestore.instance.collection('markers').add({
// //       'coords':
// //           GeoPoint(first.coordinates.latitude, first.coordinates.longitude),
// //       'place': first.featureName
// //     });
// //   }

// //   Future addMarker() async {
// //     await showDialog(
// //         context: context,
// //         barrierDismissible: true,
// //         builder: (BuildContext context) {
// //           return SimpleDialog(
// //             title: Text(
// //               'Add Marker',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             children: <Widget>[
// //               TextField(
// //                 onChanged: (String enteredloc) {
// //                   setState(() {
// //                     inputaddr = enteredloc;
// //                   });
// //                 },
// //               ),
// //               SimpleDialogOption(
// //                 child: Text(
// //                   'Add It',
// //                   style: TextStyle(color: Colors.red),
// //                 ),
// //                 onPressed: () {
// //                   addToList();

// //                   Navigator.of(context).pop();
// //                 },
// //               ),
// //             ],
// //           );
// //         });
// //   }

// //   void setSourceAndDestinationIcons() async {
// //     sourceIcon = await BitmapDescriptor.fromAssetImage(
// //         ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

// //     destinationIcon = await BitmapDescriptor.fromAssetImage(
// //         ImageConfiguration(devicePixelRatio: 2.5),
// //         'assets/destination_map_marker.png');
// //   }

// //   void onMapCreated(GoogleMapController controller) {
// //     // controller.setMapStyle(Utils.mapStyles);
// //     mapController = controller;

// //     // setMapPins();
// //     // setPolylines();
// //   }

// //   // Future<Null> displayPrediction(Prediction p) async {
// //   //   if (p != null) {
// //   //     PlacesDetailsResponse detail =
// //   //         await _places.getDetailsByPlaceId(p.placeId);

// //   //     var placeId = p.placeId;
// //   //     double lat = detail.result.geometry.location.lat;
// //   //     double lng = detail.result.geometry.location.lng;

// //   //     var address = await Geocoder.local.findAddressesFromQuery(p.description);

// //   //     print(lat);
// //   //     print(lng);
// //   //   }
// //   // }

// //   // searchNavigate() {
// //   //   Geolocator().placemarkFromAddress(searchAddr).then((value) => {
// //   //         mapController.animateCamera(CameraUpdate.newCameraPosition(
// //   //             CameraPosition(
// //   //                 target: LatLng(
// //   //                     value[0].position.latitude, value[0].position.longitude),
// //   //                 zoom: 15)))
// //   //       });
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //       appBar: AppBar(
// //         title: Text('Leaflet Maps'),
// //         leading: IconButton(
// //           icon: Icon(Icons.add),
// //           // setState()
// //           onPressed: addMarker,
// //         ),
// //         centerTitle: true,
// //       ),
// //       backgroundColor: kBackgroundBlack,
// //       body: Stack(
// //         children: <Widget>[
// //           setMapPins(),
// //           if (!pill)
// //             MapPinPillComponent(
// //                 // pill: pill,
// //                 pinPillPosition: pinPillPosition,
// //                 currentlySelectedPin: currentlySelectedPin),
// //           // PillPositioned(),
// //           Positioned(
// //               top: 110.0,
// //               left: 0,
// //               right: MediaQuery.of(context).size.width * 0.8,
// //               child: new SizedBox(
// //                   height: 45,
// //                   width: 45,
// //                   child: new IconButton(
// //                     padding: new EdgeInsets.all(0.0),
// //                     color: Colors.black,
// //                     icon: new Icon(FontAwesomeIcons.arrowLeft, size: 40.0),
// //                     onPressed: () => Navigator.of(context).pop(),
// //                   ))),
// //           // Positioned(
// //           //   bottom: 0,
// //           //   right: 0,
// //           //   left: 0,
// //           //   child: Container(
// //           //     padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
// //           //     height: MediaQuery.of(context).size.height * 0.3,
// //           //     width: double.infinity,
// //           //     decoration: BoxDecoration(
// //           //         borderRadius: BorderRadius.only(
// //           //           topLeft: Radius.circular(40),
// //           //           topRight: Radius.circular(40),
// //           //         ),
// //           //         color: Colors.white),
// //           //     child: Column(
// //           //       crossAxisAlignment: CrossAxisAlignment.center,
// //           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           //       children: <Widget>[
// //           //         Text(
// //           //           'Locate a Store',
// //           //           style: TextStyle(
// //           //               color: Colors.black,
// //           //               fontWeight: FontWeight.bold,
// //           //               fontSize: 22),
// //           //         ),
// //           //         Text(
// //           //           'Easily Locate a store from your current location.Click locate below',
// //           //           style: TextStyle(color: Colors.grey, fontSize: 18),
// //           //         ),
// //           //         RaisedButton(
// //           //           child: Text(
// //           //             'LOCATE',
// //           //             style: TextStyle(
// //           //               color: Colors.white,
// //           //               fontSize: 16,
// //           //             ),
// //           //           ),
// //           //           onPressed: () {},
// //           //           padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
// //           //           shape: RoundedRectangleBorder(
// //           //             borderRadius: new BorderRadius.circular(30),
// //           //           ),
// //           //           color: Colors.red,
// //           //         ),
// //           //       ],
// //           //     ),
// //           //   ),
// //           // ),
// //         ],
// //       ),
// //     ));
// //   }
// // }

// // **********************************************************
