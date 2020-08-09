// import 'package:flutter/material.dart';
// import '../constants.dart';
// import 'login_screen.dart';
// import 'package:geolocator/geolocator.dart';

// class PreLoginScreen extends StatefulWidget {
//   @override
//   _PreLoginScreenState createState() => _PreLoginScreenState();
// }

// class _PreLoginScreenState extends State<PreLoginScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   openLoginScreen({bool isService}) {
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation) {
//           return LoginScreen(
//             isService: isService,
//           );
//         },
//         transitionDuration: Duration(milliseconds: 500),
//         transitionsBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation, Widget child) {
//           return SlideTransition(
//             position: animation.drive(
//                 Tween(begin: Offset(0.0, -1.0), end: Offset.zero)
//                     .chain(CurveTween(curve: Curves.ease))),
//             child: child,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: themeLightYellow,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Hero(
//                 tag: 'logo',
//                 child: Container(
//                   child: Image.asset('images/logo.png', width: 180),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Container(
//                     height: 6.0,
//                     width: MediaQuery.of(context).size.width * 0.38,
//                     color: themeBlue,
//                   ),
//                   Icon(
//                     Icons.star,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     size: 15,
//                   ),
//                   Container(
//                     height: 6.0,
//                     width: MediaQuery.of(context).size.width * 0.38,
//                     color: themeBlue,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: 10,
//                 ),
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: themeBlue,
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               print('user pressed');
//                               openLoginScreen(isService: false);
//                               //TODO: User login
//                             },
//                             child: Container(
//                               height: 100,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 color: themeYellow,
//                               ),
//                               child: FittedBox(
//                                 fit: BoxFit.fitHeight,
//                                 child: ClipRRect(
//                                   child: Image.asset('images/user.png'),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             'USER',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () {
//                                   //TODO: Service login
//                                   openLoginScreen(isService: true);
//                                 },
//                                 child: Container(
//                                   height: 100,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.4,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                     color: themeYellow,
//                                   ),
//                                   child: FittedBox(
//                                     fit: BoxFit.fitHeight,
//                                     child: ClipRRect(
//                                       child: Image.asset(
//                                           'images/service-center.png'),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'Service Center',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () {
//                                   //TODO: Employee login
//                                 },
//                                 child: Container(
//                                   height: 100,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.4,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                     color: themeYellow,
//                                   ),
//                                   child: FittedBox(
//                                     fit: BoxFit.fitHeight,
//                                     child: ClipRRect(
//                                       child: Image.asset(
//                                           'images/fiklu_employee.png'),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'Fiklu Employee',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
