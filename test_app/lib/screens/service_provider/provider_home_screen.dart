// import 'package:fiklu_app/components/service_icon.dart';
// import 'package:fiklu_app/root.dart';
// import 'package:fiklu_app/screens/service_provider/add_service.dart';
// import 'package:fiklu_app/screens/service_provider/booking_form_screen.dart';
// import 'package:fiklu_app/screens/service_provider/center_updation.dart';
// import 'package:fiklu_app/screens/service_provider/profile_details.dart';
// import 'package:fiklu_app/screens/service_provider/service_history.dart';
// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fiklu_app/current_user.dart';
// import 'package:provider/provider.dart';

// class ProviderHomeScreen extends StatefulWidget {
//   @override
//   _ProviderHomeScreenState createState() => _ProviderHomeScreenState();
// }

// class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
//   bool openStatus = true;

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

//   Future<bool> _openConfirmDialog() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Are you sure'),
//             content: openStatus
//                 ? Text('Do you want to turn it to closed?')
//                 : Text('Do you want to turn it to open?'),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text('No'),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     openStatus = !openStatus;
//                   });
//                   Navigator.of(context).pop(false);
//                 },
//                 child: Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         backgroundColor: themeYellow,
//         body: SafeArea(
//           child: Stack(
//             children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Hero(
//                     tag: 'logo',
//                     child: Image.asset(
//                       'images/logo.png',
//                       width: 100,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: CircleAvatar(
//                           backgroundImage: AssetImage('images/pro-pic.png'),
//                           radius: 35,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                         child: Column(
//                           children: <Widget>[
//                             openStatus ? Text('Open') : Text('Closed'),
//                             Switch(
//                               value: openStatus,
//                               onChanged: (val) {
//                                 _openConfirmDialog();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                       child: Icon(
//                         Icons.notifications,
//                         color: Colors.black54,
//                         size: 35,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         height: 6.0,
//                         width: MediaQuery.of(context).size.width * 0.38,
//                         color: themeBlue,
//                       ),
//                       Icon(
//                         Icons.star,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star,
//                         size: 15,
//                       ),
//                       Container(
//                         height: 6.0,
//                         width: MediaQuery.of(context).size.width * 0.38,
//                         color: themeBlue,
//                       ),
//                     ],
//                   ),
//                   MenuGrid(),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: MaterialButton(
//                   onPressed: () async {
//                     CurrentUser _currentUser =
//                         Provider.of<CurrentUser>(context, listen: false);
//                     String _returnString = await _currentUser.signOut();
//                     if (_returnString == 'success') {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => OurRoot()),
//                           (route) => false);
//                     }
//                   },
//                   color: themeLightYellow,
//                   child: Container(
//                     width: 80,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Icon(Icons.power_settings_new),
//                         Text('Log Out'),
//                       ],
//                     ),
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

// class MenuGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ServiceIcon(
//                 icon: Icons.room,
//                 text: 'BOOKING DETAILS',
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => BookingForm()));
//                 },
//               ),
//               ServiceIcon(
//                 icon: Icons.add_alarm,
//                 text: 'ADD\nSERVICE',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => AddServiceScreen()));
//                 },
//               ),
//               ServiceIcon(
//                 icon: Icons.assignment,
//                 text: 'COMPLETE SUBMISSION',
//                 onTap: () {},
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ServiceIcon(
//                 icon: Icons.calendar_today,
//                 text: 'SERVICE HISTORY',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ServiceHistory()));
//                 },
//               ),
//               ServiceIcon(
//                 icon: Icons.update,
//                 text: 'CENTER UPDATION',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => CenterUpdation()));
//                 },
//               ),
//               ServiceIcon(
//                 icon: FontAwesomeIcons.rupeeSign,
//                 text: 'PAYMENT DETIALS',
//                 onTap: () {},
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ServiceIcon(
//                 icon: FontAwesomeIcons.donate,
//                 text: 'DONATE',
//                 onTap: () {},
//               ),
//               ServiceIcon(
//                 icon: Icons.autorenew,
//                 text: 'MEMBERSHIP RENEWED',
//                 onTap: () {},
//               ),
//               ServiceIcon(
//                 icon: Icons.account_box,
//                 text: 'PROFILE DETAILS',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ProfileDetails()));
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
