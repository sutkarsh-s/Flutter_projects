// import 'package:fiklu_app/constants.dart';
// import 'package:flutter/material.dart';

// class AddServiceScreen extends StatefulWidget {
//   @override
//   _AddServiceScreenState createState() => _AddServiceScreenState();
// }

// class _AddServiceScreenState extends State<AddServiceScreen> {
//   Widget _service() {
//     return Container(
//       child: Material(
//         color: Colors.white,
//         elevation: 4.0,
//         borderRadius: BorderRadius.circular(4.0),
//         shadowColor: Color(0x802196F3),
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Service Name:',
//                 style: TextStyle(fontSize: 20),
//               ),
//               Text(
//                 'Product Name:',
//                 style: TextStyle(fontSize: 20),
//               ),
//               Text(
//                 'Extra Service:',
//                 style: TextStyle(fontSize: 20),
//               ),
//               Text(
//                 'Total Amount:',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: themeLightYellow,
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0),
//           // height: 150.0,
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: <Widget>[
//               SizedBox(width: 10.0),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _service(),
//               ),
//               SizedBox(width: 10.0),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _service(),
//               ),
//               SizedBox(width: 10.0),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _service(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
