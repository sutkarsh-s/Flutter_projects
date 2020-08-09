// import 'package:fiklu_app/screens/intro_splash_screen.dart';
// import 'package:fiklu_app/screens/service_provider/provider_home_screen.dart';
// import 'package:flutter/material.dart';
// import 'current_user.dart';
// import 'package:provider/provider.dart';

// enum AuthStatus {
//   notLoggedIn,
//   loggedIn,
// }

// class OurRoot extends StatefulWidget {
//   @override
//   _OurRootState createState() => _OurRootState();
// }

// class _OurRootState extends State<OurRoot> {
//   AuthStatus _authStatus = AuthStatus.notLoggedIn;
//   bool isService;

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();

//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     String _returnString = await _currentUser.onStartup();
//     if (_returnString == 'success') {
//       isService = await _currentUser.checkService(_currentUser.getEmail);
//       setState(() {
//         _authStatus = AuthStatus.loggedIn;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget retVal;
//     if (_authStatus == AuthStatus.notLoggedIn) {
//       retVal = IntroSplashScreen('login');
//     } else if (_authStatus == AuthStatus.loggedIn && isService == true) {
//       retVal = IntroSplashScreen('provider');
//     } else {
//       retVal = IntroSplashScreen('user');
//     }

//     return retVal;
//   }
// }
