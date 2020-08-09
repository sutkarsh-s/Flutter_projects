// import 'dart:async';
// import 'package:fiklu_app/screens/user/user_home_screen.dart';
// import 'package:flutter/material.dart';
// import '../../constants.dart';

// class PaymentDoneScreen extends StatefulWidget {
//   @override
//   _PaymentDoneScreenState createState() => _PaymentDoneScreenState();
// }

// class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: initScreen(context),
//     );
//   }

//   startTime() async {
//     var duration = new Duration(seconds: 3);
//     return new Timer(duration, routeHome);
//   }

//   void routeHome() {
//     Navigator.pushAndRemoveUntil(
//         context,
//         PageRouteBuilder(
//           transitionDuration: Duration(seconds: 3),
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secAnimation,
//               Widget child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secAnimation) {
//             return UserHomeScreen();
//           },
//         ),
//         (route) => false);
//   }

//   Future<void> pushAndReplace() async {
//     final current = ModalRoute.of(context);
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         transitionDuration: Duration(seconds: 3),
//         transitionsBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation, Widget child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//         pageBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation) {
//           return UserHomeScreen();
//         },
//       ),
//     );
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.removeRoute(context, current);
//   }

//   initScreen(BuildContext context) {
//     return Scaffold(
//       backgroundColor: themeYellow,
//       body: Center(
//         child: Container(
//           alignment: Alignment.center,
//           child: Text(
//             'Your Payment Successfully Done. \n\nTHANK YOU!',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
