// import 'package:flutter/material.dart';

// class PillPositioned extends StatefulWidget {
//   @override
//   _PillPositionedState createState() => _PillPositionedState();
// }

// class _PillPositionedState extends State<PillPositioned> {
//   String searchAddr;
//   final _textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 0,
//       right: 0,
//       left: 0,
//       child: Container(
//         padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//         height: 110,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(50),
//               bottomRight: Radius.circular(50),
//             ),
//             color: Colors.black),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Search',
//               style: TextStyle(
//                   color: Colors.white,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 22),
//             ),
//             Expanded(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                           controller: _textController,
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green),
//                             ),
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             // suffix: GestureDetector(
//                             //   onTap: () async {
//                             //     // show input autocomplete with selected mode
//                             //     // then get the Prediction selected
//                             //     Prediction p =
//                             //         await PlacesAutocomplete.show(
//                             //             context: context,
//                             //             apiKey: kGoogleApiKey,
//                             //             mode: Mode.fullscreen);
//                             //     displayPrediction(p);
//                             //   },
//                             // ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           onChanged: (value) {
//                             setState(() {
//                               searchAddr = value;
//                             });
//                           }),
//                     ),
//                     IconButton(
//                       icon: new Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                       iconSize: 30,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
