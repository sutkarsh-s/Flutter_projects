// import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../screens/user/payment_screen.dart';

// class ServiceCenterMap extends StatelessWidget {
//   final String docId;
//   final String name;
//   final double distance;
//   ServiceCenterMap({this.name, this.docId, this.distance});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: FittedBox(
//         child: Material(
//           color: Colors.white,
//           elevation: 14.0,
//           borderRadius: BorderRadius.circular(24.0),
//           shadowColor: Color(0x802196F3),
//           child: Container(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.location_on,
//                           color: Colors.red,
//                         ),
//                         Text('$distance km'),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       LimitedBox(
//                         maxHeight: 40,
//                         maxWidth: 40,
//                         child: Container(
//                           child: FittedBox(
//                             fit: BoxFit.fitHeight,
//                             child: Image.asset('images/service-employee.png'),
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: themeYellow,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       FlatButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       PaymentScreen(docId: docId)));
//                         },
//                         child: Text('SELECT'),
//                         textColor: themeYellow,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           side: BorderSide(color: themeYellow),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
