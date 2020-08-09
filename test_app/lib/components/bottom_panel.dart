// import 'package:fiklu_app/screens/user/previous-service.dart';
// import 'package:fiklu_app/screens/user/profile_screen.dart';
// import 'package:fiklu_app/screens/user/user_home_screen.dart';
// import 'package:fiklu_app/screens/user/your_booking.dart';
// import 'package:flutter/material.dart';

// class BottomPannel extends StatelessWidget {
//   final String home, profile, bookmark, settings;
//   BottomPannel(
//       {this.home = 'inactive',
//       this.bookmark = 'inactive',
//       this.profile = 'inactive',
//       this.settings = 'inactive'});
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: Container(
//         width: double.infinity,
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             FlatButton(
//               onPressed: () {
//                 if (home != 'active') {
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => UserHomeScreen()),
//                       (route) => false);
//                 }
//               },
//               child: Image.asset(
//                 'images/home-$home.png',
//                 width: 40,
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 if (profile != 'active') {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ProfileScreen()));
//                 }
//               },
//               child: Image.asset(
//                 'images/profile-$profile.png',
//                 width: 40,
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 if (bookmark != 'active') {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => YourBookingScreen()));
//                 }
//               },
//               child: Image.asset(
//                 'images/bookmark-$bookmark.png',
//                 width: 40,
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 if (settings != 'active') {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PreviousServices()));
//                 }
//               },
//               child: Image.asset(
//                 'images/settings-$settings.png',
//                 width: 40,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
