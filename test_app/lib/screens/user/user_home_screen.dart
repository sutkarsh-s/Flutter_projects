// import 'package:fiklu_app/components/bottom_panel.dart';
// import 'package:fiklu_app/models/map_accessory.dart';
// import 'package:flutter/material.dart';
// import 'package:fiklu_app/components/content_icons.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import '../../constants.dart';
// import 'package:fiklu_app/current_user.dart';
// import 'package:provider/provider.dart';
// import 'package:fiklu_app/root.dart';
// import 'register_vehicle_screen.dart';

// class UserHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return HomeScreenContent(context: context);
//   }
// }

// class HomeScreenContent extends StatelessWidget {
//   final BuildContext context;
//   HomeScreenContent({this.context});
//   void openVehicleRegisterScreen(String vehType) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => RegisterVehicleScreen(vehType)));
//   }

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => new AlertDialog(
//             title: new Text('Are you sure?'),
//             content: new Text('Do you want to exit an App'),
//             actions: <Widget>[
//               new FlatButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: new Text('No'),
//               ),
//               new FlatButton(
//                 onPressed: () => SystemNavigator.pop(),
//                 child: new Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   // void dothings() async {
//   //   print('started');
//   //   double dist = await MapAccessory()
//   //       .getRouteDistanceBetween(PointLatLng(23, 85), PointLatLng(23.3, 85));
//   //   print(dist);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // dothings();
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         backgroundColor: themeLightYellow,
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                 color: themeYellow,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 280,
//                       child: Stack(
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               Container(
//                                 child: Hero(
//                                   tag: 'logo',
//                                   child: Image.asset(
//                                     'images/logo.png',
//                                     width: 160,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     ContentPalette(
//                                       showText: 'Bike',
//                                       img: AssetImage('images/bike.png'),
//                                       bgcolor: themeLightYellow,
//                                       txtcolor: Colors.black,
//                                       onClick: () {
//                                         //TODO: Bike Action
//                                         openVehicleRegisterScreen('bike');
//                                       },
//                                     ),
//                                     ContentPalette(
//                                       showText: 'Car',
//                                       img: AssetImage('images/car.png'),
//                                       bgcolor: themeLightYellow,
//                                       txtcolor: Colors.black,
//                                       onClick: () {
//                                         //TODO: Car Action
//                                         openVehicleRegisterScreen('car');
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: MaterialButton(
//                               onPressed: () async {
//                                 CurrentUser _currentUser =
//                                     Provider.of<CurrentUser>(context,
//                                         listen: false);
//                                 String _returnString =
//                                     await _currentUser.signOut();
//                                 if (_returnString == 'success') {
//                                   Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => OurRoot()),
//                                       (route) => false);
//                                 }
//                               },
//                               color: themeLightYellow,
//                               child: Container(
//                                 width: 80,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     Icon(Icons.power_settings_new),
//                                     Text('Log Out'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       color: themeLightYellow,
//                       child: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 ContentPalette(
//                                   showText: 'TV',
//                                   img: AssetImage('images/tv.png'),
//                                   bgcolor: themeYellow,
//                                   txtcolor: Colors.black,
//                                   onClick: () {
//                                     //TODO: TV Action
//                                   },
//                                 ),
//                                 ContentPalette(
//                                   showText: 'Fridge',
//                                   img: AssetImage('images/fridge.png'),
//                                   bgcolor: themeYellow,
//                                   txtcolor: Colors.black,
//                                   onClick: () {
//                                     //TODO: Fridge Action
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 ContentPalette(
//                                   showText: 'AC',
//                                   img: AssetImage('images/ac.png'),
//                                   bgcolor: themeYellow,
//                                   txtcolor: Colors.black,
//                                   onClick: () {
//                                     //TODO: AC Action
//                                   },
//                                 ),
//                                 ContentPalette(
//                                   showText: 'Washing Machine',
//                                   img: AssetImage('images/wash-mach.png'),
//                                   bgcolor: themeYellow,
//                                   txtcolor: Colors.black,
//                                   onClick: () {
//                                     //TODO: Washing Machine Action
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: BottomPannel(
//                         home: 'active',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
