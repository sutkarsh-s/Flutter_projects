// import 'dart:collection';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../components/map_service_center.dart';
// import '../../models/map_accessory.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import '../../constants.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../models/vehicles.dart';
// import 'dart:math' show cos, sqrt, asin;
// import 'package:provider/provider.dart';
// import '../../current_user.dart';
// import 'package:geolocator/geolocator.dart';

// final _firestore = Firestore.instance;

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController _controller;

//   String googleAPIKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";

//   BitmapDescriptor sourceIcon;
//   BitmapDescriptor destinationIcon;

//   final Geolocator _geolocator = Geolocator();

//   Position _currentPosition;
//   String _currentAddress;

//   final startAddressController = TextEditingController();
//   final destinationAddressController = TextEditingController();

//   String _startAddress = '';
//   String _destinationAddress = '';
//   String _placeDistance;

//   Set<Marker> markers = {};

//   PolylinePoints polylinePoints;
//   Set<Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];

//   LatLng sourceLocation;

//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//   }

//   final CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(23, 85),
//     zoom: 10,
//   );

//   // Widget topContainer(CurrentUser currentUser) {
//   //   VehicleService _vehicleService = VehicleService();
//   //   String vehicleType =
//   //       (_vehicleService.vehicleType == VehType.bike) ? 'Bike' : 'Car';
//   //   String vehicleName = _vehicleService.vehicleName;
//   //   return Align(
//   //     alignment: Alignment.topCenter,
//   //     child: SizedBox(
//   //       height: MediaQuery.of(context).size.height * 0.28,
//   //       width: double.infinity,
//   //       child: Container(
//   //         padding: EdgeInsets.all(10),
//   //         color: themeYellow,
//   //         child: Column(
//   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //           children: <Widget>[
//   //             Image.asset('images/logo.png', width: 100),
//   //             Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: <Widget>[
//   //                 Text('Name: ${_vehicleService.ownerName}'),
//   //                 Text('E-mail: ${currentUser.getEmail}'),
//   //                 Text('Vehicle Details: $vehicleType $vehicleName'),
//   //               ],
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   _getCurrentLocation() async {
//     await _geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) async {
//       setState(() {
//         _currentPosition = position;
//         sourceLocation =
//             LatLng(_currentPosition.latitude, _currentPosition.longitude);
//         print('CURRENT POS: $_currentPosition');
//         _controller.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 14.0,
//             ),
//           ),
//         );
//       });
//       await _getAddress();
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   // Method for retrieving the address
//   _getAddress() async {
//     try {
//       List<Placemark> p = await _geolocator.placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);

//       Placemark place = p[0];

//       setState(() {
//         _currentAddress =
//             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
//         startAddressController.text = _currentAddress;
//         _startAddress = _currentAddress;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   // Method for calculating the distance between two places
//   Future<bool> _calculateDistance() async {
//     try {
//       // Retrieving placemarks from addresses
//       List<Placemark> startPlacemark =
//           await _geolocator.placemarkFromAddress(_startAddress);
//       List<Placemark> destinationPlacemark =
//           await _geolocator.placemarkFromAddress(_destinationAddress);

//       if (startPlacemark != null && destinationPlacemark != null) {
//         // Use the retrieved coordinates of the current position,
//         // instead of the address if the start position is user's
//         // current position, as it results in better accuracy.
//         Position startCoordinates = _startAddress == _currentAddress
//             ? Position(
//                 latitude: _currentPosition.latitude,
//                 longitude: _currentPosition.longitude)
//             : startPlacemark[0].position;
//         Position destinationCoordinates = destinationPlacemark[0].position;

//         // Start Location Marker
//         Marker startMarker = Marker(
//           markerId: MarkerId('$startCoordinates'),
//           position: LatLng(
//             startCoordinates.latitude,
//             startCoordinates.longitude,
//           ),
//           infoWindow: InfoWindow(
//             title: 'Start',
//             snippet: _startAddress,
//           ),
//           icon: BitmapDescriptor.defaultMarker,
//         );

//         // Destination Location Marker
//         Marker destinationMarker = Marker(
//           markerId: MarkerId('$destinationCoordinates'),
//           position: LatLng(
//             destinationCoordinates.latitude,
//             destinationCoordinates.longitude,
//           ),
//           infoWindow: InfoWindow(
//             title: 'Destination',
//             snippet: _destinationAddress,
//           ),
//           icon: BitmapDescriptor.defaultMarker,
//         );

//         // Adding the markers to the list
//         markers.add(startMarker);
//         markers.add(destinationMarker);

//         print('START COORDINATES: $startCoordinates');
//         print('DESTINATION COORDINATES: $destinationCoordinates');

//         Position _northeastCoordinates;
//         Position _southwestCoordinates;

//         // Calculating to check that
//         // southwest coordinate <= northeast coordinate
//         if (startCoordinates.latitude <= destinationCoordinates.latitude) {
//           _southwestCoordinates = startCoordinates;
//           _northeastCoordinates = destinationCoordinates;
//         } else {
//           _southwestCoordinates = destinationCoordinates;
//           _northeastCoordinates = startCoordinates;
//         }

//         // Accomodate the two locations within the
//         // camera view of the map
//         _controller.animateCamera(
//           CameraUpdate.newLatLngBounds(
//             LatLngBounds(
//               northeast: LatLng(
//                 _northeastCoordinates.latitude,
//                 _northeastCoordinates.longitude,
//               ),
//               southwest: LatLng(
//                 _southwestCoordinates.latitude,
//                 _southwestCoordinates.longitude,
//               ),
//             ),
//             100.0,
//           ),
//         );

//         await _createPolylines(startCoordinates, destinationCoordinates);

//         double totalDistance = 0.0;

//         // Calculating the total distance by adding the distance
//         // between small segments
//         for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//           totalDistance += _coordinateDistance(
//             polylineCoordinates[i].latitude,
//             polylineCoordinates[i].longitude,
//             polylineCoordinates[i + 1].latitude,
//             polylineCoordinates[i + 1].longitude,
//           );
//         }

//         setState(() {
//           _placeDistance = totalDistance.toStringAsFixed(2);
//           print('DISTANCE: $_placeDistance km');
//         });

//         return true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }

//   // Formula for calculating distance between two coordinates
//   // https://stackoverflow.com/a/54138876/11910277
//   double _coordinateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }

//   // Create the polylines for showing the route between two places
//   _createPolylines(start, destination) async {
//     polylinePoints = PolylinePoints();
//     List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPIKey, // Google Maps API Key
//       start.latitude, start.longitude,
//       destination.latitude, destination.longitude,
//     );

//     if (result.isNotEmpty) {
//       result.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }

//     Polyline polyline = Polyline(
//       polylineId: PolylineId("poly"),
//       color: Color.fromARGB(255, 40, 122, 198),
//       points: polylineCoordinates,
//       width: 3,
//     );
//     polylines.add(polyline);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     // VehicleService vehicleService = VehicleService();
//     // Set<Marker> _markers = HashSet<Marker>();
//     // List<ServiceCenterMap> serviceWidgets = [];
//     // String vehicleType =
//     //     (vehicleService.vehicleType == VehType.bike) ? 'bike' : 'car';
//     // String serviceType;
//     // switch (vehicleService.serviceType) {
//     //   case ServiceType.fullService:
//     //     serviceType = 'full_service';
//     //     break;
//     //   case ServiceType.partService:
//     //     serviceType = 'part_service';
//     //     break;
//     //   case ServiceType.washing:
//     //     serviceType = 'washing';
//     //     break;
//     //   case ServiceType.emergencyService:
//     //     serviceType = 'emergency_service';
//     //     break;
//     //   default:
//     // }
//     // return StreamBuilder<QuerySnapshot>(
//     //   stream: _firestore
//     //       .collection('service_centers')
//     //       .where('isOpen', isEqualTo: true)
//     //       .where(vehicleType, isEqualTo: true)
//     //       .snapshots(),
//     //   builder: (context, snapshot) {
//     //     final centers = snapshot.data.documents;
//     //     for (var center in centers) {
//     //       if (center.data.containsKey(serviceType)) {
//     //         int i = 0;
//     //         String name = center.data['name'];
//     //         final location = center.data['location'];
//     //         double distance;
//     //         _markers.add(Marker(
//     //           markerId: MarkerId('$i'),
//     //           position: LatLng(location.latitude, location.longitude),
//     //           infoWindow: InfoWindow(
//     //             title: '$name',
//     //             // snippet: '0 m',
//     //           ),
//     //         ));
//     //         //
//     //         //
//     //         //
//     //         //TODO: calculate distance here before passing to ServiceCenterMap
//     //         //
//     //         //
//     //         //
//     //         serviceWidgets.add(ServiceCenterMap(
//     //           name: name,
//     //           docId: center.documentID,
//     //           distance: distance,
//     //         ));
//     //         i = i + 1;
//     //       }
//     //     }
//         return SafeArea(
//           child: Scaffold(
//             body: Stack(
//               children: <Widget>[
//                 Container(
//                   child: GoogleMap(
//                     zoomControlsEnabled: false,
//                     initialCameraPosition: _initialPosition,
//                     mapType: MapType.normal,
//                     onMapCreated: _onMapCreated,
//                     myLocationEnabled: true,
//                     onTap: (cordinate) {
//                       _controller
//                           .animateCamera(CameraUpdate.newLatLng(cordinate));
//                     },
//                     // markers: _markers,
//                   ),
//                 ),
//                 // topContainer(_currentUser),
//                 // Align(
//                 //   alignment: Alignment.bottomLeft,
//                 //   child: Container(
//                 //     margin: EdgeInsets.symmetric(vertical: 20),
//                 //     height: 150,
//                 //     child: ListView(
//                 //       scrollDirection: Axis.horizontal,
//                 //       children: serviceWidgets,
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         );
//       }
// }
