import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinInformation {
  String pinPath;
  String avatarPath;
  LatLng location;
  String address;
  String distance;
  String locationName;
  Color labelColor;

  PinInformation(
      {this.pinPath,
      this.avatarPath,
      this.location,
      this.address,
      this.distance,
      this.locationName,
      this.labelColor});
}
