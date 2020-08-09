import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:baarbo/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../screens/pill_positioned.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../components/map_pin_pill.dart';
import 'dart:math' show cos, sqrt, asin;
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../models/pin_pill_info.dart';

const kGoogleApiKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";

const double CAMERA_ZOOM = 10;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(25.4484, 78.5685);
const LatLng DEST_LOCATION = LatLng(26.4499, 80.3319);

LatLng loc = LatLng(25.4484, 78.5685);
double lat2 = loc.latitude;
double long2 = loc.longitude;

class SearchStore extends StatefulWidget {
  static const routeName = '/Search';

  @override
  _SearchStoreState createState() => _SearchStoreState();
}

class _SearchStoreState extends State<SearchStore> {
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(25.4484, 78.5685));
  GoogleMapController mapController;
  String googleAPIKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";

  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  double pinPillPosition = -100;
  bool pill = true;
  final Geolocator _geolocator = Geolocator();
  PinInformation currentlySelectedPin = PinInformation(
      pinPath: '',
      avatarPath: '',
      address: '',
      distance: '',
      location: LatLng(0, 0),
      locationName: '',
      labelColor: Colors.grey);
  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo;

  Position _currentPosition;
  String _currentAddress;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  LatLng sourceLocation;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _textField({
    TextEditingController controller,
    String label,
    String hint,
    String initialValue,
    double width,
    Icon prefixIcon,
    Widget suffixIcon,
    Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        // initialValue: initialValue,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        sourceLocation =
            LatLng(_currentPosition.latitude, _currentPosition.longitude);
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Placemark> startPlacemark =
          await _geolocator.placemarkFromAddress(_startAddress);
      List<Placemark> destinationPlacemark =
          await _geolocator.placemarkFromAddress(_destinationAddress);

      if (startPlacemark != null && destinationPlacemark != null) {
        // Use the retrieved coordinates of the current position,
        // instead of the address if the start position is user's
        // current position, as it results in better accuracy.
        Position startCoordinates = _startAddress == _currentAddress
            ? Position(
                latitude: _currentPosition.latitude,
                longitude: _currentPosition.longitude)
            : startPlacemark[0].position;
        Position destinationCoordinates = destinationPlacemark[0].position;

        // Start Location Marker

        // Adding the markers to the list

        print('START COORDINATES: $startCoordinates');
        print('DESTINATION COORDINATES: $destinationCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that
        // southwest coordinate <= northeast coordinate
        if (startCoordinates.latitude <= destinationCoordinates.latitude) {
          _southwestCoordinates = startCoordinates;
          _northeastCoordinates = destinationCoordinates;
        } else {
          _southwestCoordinates = destinationCoordinates;
          _northeastCoordinates = startCoordinates;
        }

        // Accomodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );
        await _createPolylines(startCoordinates, destinationCoordinates);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        for (int i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude,
          );
        }

        setState(() {
          _placeDistance = totalDistance.toStringAsFixed(2);
          print('DISTANCE: $_placeDistance km');
          Marker startMarker = Marker(
            markerId: MarkerId('$startCoordinates'),
            position: LatLng(
              startCoordinates.latitude,
              startCoordinates.longitude,
            ),
            infoWindow: InfoWindow(
              title: 'Start',
              snippet: _startAddress,
            ),
            icon: BitmapDescriptor.defaultMarker,
          );

          // Destination Location Marker
          Marker destinationMarker = Marker(
            markerId: MarkerId('$destinationCoordinates'),
            position: LatLng(
              destinationCoordinates.latitude,
              destinationCoordinates.longitude,
            ),
            infoWindow: InfoWindow(
              title: _destinationAddress,
              snippet: 'Distance: $_placeDistance km',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          );
          markers.add(startMarker);
          markers.add(destinationMarker);
        });

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(start, destination) async {
    polylinePoints = PolylinePoints();
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey, // Google Maps API Key
      start.latitude, start.longitude,
      destination.latitude, destination.longitude,
    );

    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    Polyline polyline = Polyline(
      polylineId: PolylineId("poly"),
      color: Color.fromARGB(255, 40, 122, 198),
      points: polylineCoordinates,
      width: 3,
    );
    polylines.add(polyline);
  }

  // Future<double> getDist({var latt, var longg}) async {
  //   double distanceInMeters = await Geolocator().distanceBetween(
  //       latt,
  //       longg,
  //       lat2,
  //       long2); // lat2 and long2 are global variables with current user's location

  //   return distanceInMeters;
  // }

  Widget setMapPins() {
    return StreamBuilder(
        stream: Firestore.instance.collection('shops').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading maps... Please Wait');
          for (int i = 0; i < snapshot.data.documents.length; i++) {
            print(snapshot.data.documents[i]);

            destinationPinInfo = PinInformation(
                locationName: "End Location",
                location: LatLng(snapshot.data.documents[i]['coords'].latitude,
                    snapshot.data.documents[i]['coords'].longitude),
                address: snapshot.data.documents[i]['Address'],
                pinPath: "assets/destination_map_marker.png",
                avatarPath: "assets/friend2.jpg",
                labelColor: Colors.purple);

            // Future<double> dist = getDist(
            //     latt: snapshot.data.documents[i]['coords'].latitude,
            //     longg: snapshot.data.documents[i]['coords'].longitude);
            // print(
            //     '*************************************************************//////////////');

            // dist.then((value) => print(value));

            markers.add(Marker(
                markerId: MarkerId(snapshot.data.documents[i]['Id'].toString()),
                position: LatLng(snapshot.data.documents[i]['coords'].latitude,
                    snapshot.data.documents[i]['coords'].longitude),
                onTap: () {
                  setState(() {
                    pill = false;
                    currentlySelectedPin = destinationPinInfo;
                    pinPillPosition = 0;
                  });
                },
                icon: destinationIcon));
          }
          return Container();
        });
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            setMapPins(),
            GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: polylines,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onTap: (LatLng location) {
                setState(() {
                  pinPillPosition = -100;
                  pill = true;
                });
              },
            ),
            if (!pill)
              MapPinPillComponent(
                  // pill: pill,
                  pinPillPosition: pinPillPosition,
                  currentlySelectedPin: currentlySelectedPin),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.brown[400], // button color
                        child: InkWell(
                          splashColor: Colors.brown[300], // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.brown[400], // button color
                        child: InkWell(
                          splashColor: Colors.brown[300], // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.grey),
                // width: width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      _textField(
                          label: 'Destination',
                          hint: 'Choose destination',
                          initialValue: '',
                          controller: destinationAddressController,
                          width: width,
                          locationCallback: (String value) {
                            setState(() {
                              _destinationAddress = value;
                            });
                          }),
                      SizedBox(height: 10),
                      Visibility(
                        visible: _placeDistance == null ? false : true,
                        child: Text(
                          'DISTANCE: $_placeDistance km',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      RaisedButton(
                        onPressed: (_startAddress != '' &&
                                _destinationAddress != '')
                            ? () async {
                                setState(() {
                                  if (markers.isNotEmpty) markers.clear();
                                  if (polylines.isNotEmpty) polylines.clear();
                                  if (polylineCoordinates.isNotEmpty)
                                    polylineCoordinates.clear();
                                  _placeDistance = null;
                                });

                                _calculateDistance().then((isCalculated) {
                                  if (isCalculated) {
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Distance Calculated Sucessfully'),
                                      ),
                                    );
                                  } else {
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Error Calculating Distance'),
                                      ),
                                    );
                                  }
                                });
                              }
                            : null,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Show Route'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 130.0,
                left: 0,
                right: MediaQuery.of(context).size.width * 0.8,
                child: new SizedBox(
                    height: 45,
                    width: 45,
                    child: new IconButton(
                      padding: new EdgeInsets.all(0.0),
                      color: Colors.black,
                      icon: new Icon(FontAwesomeIcons.arrowLeft, size: 40.0),
                      onPressed: () => Navigator.of(context).pop(),
                    ))),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Locate a Store',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      'Easily Locate a store from your current location.Click locate below',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    RaisedButton(
                      child: Text(
                        'LOCATE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
