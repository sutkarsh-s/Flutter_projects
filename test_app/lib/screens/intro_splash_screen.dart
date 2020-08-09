// import 'dart:async';
// import 'package:fiklu_app/screens/service_provider/provider_home_screen.dart';
// import 'package:flutter/material.dart';
// import 'pre_login_screen.dart';
// import 'user/user_home_screen.dart';
// import '../constants.dart';

// class IntroSplashScreen extends StatefulWidget {
//   final String nextScreen;
//   IntroSplashScreen(this.nextScreen);
//   @override
//   _IntroSplashScreenState createState() => _IntroSplashScreenState();
// }

// class _IntroSplashScreenState extends State<IntroSplashScreen> {
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
//     return new Timer(duration, pushAndReplace);
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
//           if (widget.nextScreen == 'user') {
//             return UserHomeScreen();
//           } else if (widget.nextScreen == 'login') {
//             return PreLoginScreen();
//           } else {
//             return ProviderHomeScreen();
//           }
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
//           child: Hero(
//             tag: 'logo',
//             child: Container(
//               child: Image.asset(
//                 'images/logo.png',
//                 width: 180,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
