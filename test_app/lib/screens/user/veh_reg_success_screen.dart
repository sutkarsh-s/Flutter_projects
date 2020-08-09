// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'dart:async';
// import 'service_category_screen.dart';

// class VehRegSuccessScreen extends StatefulWidget {
//   @override
//   _VehRegSuccessScreenState createState() => _VehRegSuccessScreenState();
// }

// class _VehRegSuccessScreenState extends State<VehRegSuccessScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: initScreen(context),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   startTime() async {
//     var duration = new Duration(seconds: 3);
//     return new Timer(duration, pushAndReplace);
//   }

//   Future<void> pushAndReplace() async {
//     final current = ModalRoute.of(context);
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         transitionDuration: Duration(seconds: 1),
//         transitionsBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation, Widget child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//         pageBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secAnimation) {
//           return ServiceCategoryScreen();
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
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           alignment: Alignment.center,
//           child: Text(
//             'Your Vehicle Registration Successfully Complete',
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
