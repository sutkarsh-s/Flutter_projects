// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:animate_icons/animate_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:google_maps_webservice/places.dart';

// import 'package:flutter_google_places/flutter_google_places.dart';
void main() => runApp(MyApp());

const kGoogleApiKey = "AIzaSyClPe1v_zau0NgnQS3eK5-Ge7ysNSU5Hlk";

// GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Demo(),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  DemoState createState() => new DemoState();
}

class DemoState extends State<Demo> {
  GoogleMapController mapController;
  Set<Marker> allMarkers = {};
  String inputaddr = '';

  @override
  void initState() {
    super.initState();
    loadMap();
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  setMarkers() {
    return allMarkers;
  }

  addToList() async {
    final query = inputaddr;
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    Firestore.instance.collection('markers').add({
      'coords':
          GeoPoint(first.coordinates.latitude, first.coordinates.longitude),
      'place': first.featureName
    });
  }

  Future addMarker() async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              'Add Marker',
              style: TextStyle(fontSize: 18),
            ),
            children: <Widget>[
              TextField(
                onChanged: (String enteredloc) {
                  setState(() {
                    inputaddr = enteredloc;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text(
                  'Add It',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  addToList();

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget loadMap() {
    return StreamBuilder(
        stream: Firestore.instance.collection('markers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading maps... Please Wait');
          // if (snapshot.hasData)
          for (int i = 0; i < snapshot.data.documents.length; i++) {
            allMarkers.add(Marker(
              // width: 45.0,
              // height: 45.0,
              markerId: MarkerId('<MARKER_ID>'),
              position: LatLng(snapshot.data.documents[i]['coords'].latitude,
                  snapshot.data.documents[i]['coords'].longitude),
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                print(snapshot.data.documents["place"]);
              },
            ));
          }
          print('______________________________________');
          print(allMarkers);
          print('______________________________________');
          return GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(24, 71), zoom: 10),
            onMapCreated: onMapCreated,
            markers: Set.from(allMarkers),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Leaflet Maps'),
          leading: IconButton(
            icon: Icon(Icons.add),
            // setState()
            onPressed: addMarker,
          ),
          centerTitle: true,
        ),
        body: loadMap());
  }
}
