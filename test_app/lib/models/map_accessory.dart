// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:math';

// class MapAccessory {
//   List<LatLng> polylineCoordinates;
//   Future<double> getRouteDistanceBetween(
//       PointLatLng startCoordinates, PointLatLng destinationCoordinates) async {
//     await _createPolylines(startCoordinates, destinationCoordinates);
//     print('polylines created');
//     double totalDistance = 0.0;
//     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//       totalDistance += _coordinateDistance(
//         polylineCoordinates[i].latitude,
//         polylineCoordinates[i].longitude,
//         polylineCoordinates[i + 1].latitude,
//         polylineCoordinates[i + 1].longitude,
//       );
//     }
//     return totalDistance;
//   }

//   double _coordinateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }

//   _createPolylines(PointLatLng start, PointLatLng destination) async {
//     var polylinePoints = PolylinePoints();
//     try {
//       PolylineResult polylineResult =
//           await polylinePoints.getRouteBetweenCoordinates(
//         'AIzaSyCr-MaKSrcIU2eFS6IKWCSUst0wwkW4JNM', // Google Maps API Key
//         start,
//         destination,
//       );
//       List<PointLatLng> result = polylineResult.points;
//       if (result.isNotEmpty) {
//         print('result was not empty');
//         result.forEach((PointLatLng point) {
//           polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
