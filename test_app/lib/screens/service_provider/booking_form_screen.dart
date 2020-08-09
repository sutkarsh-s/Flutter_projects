// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class BookingForm extends StatefulWidget {
//   @override
//   _BookingFormState createState() => _BookingFormState();
// }

// class _BookingFormState extends State<BookingForm> {
//   String companyName, model, regNum, useName, address, remarks;
//   File _fullimage, _frontimage, _backimage;

//   final GlobalKey<FormState> _serviceFormKey = GlobalKey<FormState>();

//   Widget _buildCompanyName() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Name of the Company',
//         contentPadding: EdgeInsets.symmetric(horizontal: 5),
//       ),
//       onSaved: (value) {
//         model = value.trim();
//       },
//     );
//   }

//   Widget _buildModel() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Model',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         model = value.trim();
//       },
//     );
//   }

//   Widget _buildRegNum() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Registration Number',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         regNum = value.trim();
//       },
//     );
//   }

//   Widget _buildUseName() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Use Name',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         useName = value.trim();
//       },
//     );
//   }

//   Widget _buildAddress() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Address',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         address = value.trim();
//       },
//     );
//   }

//   Widget _buildRemarks() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Remarks',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         remarks = value.trim();
//       },
//     );
//   }

//   Widget _buildFormText() {
//     return Form(
//       key: _serviceFormKey,
//       child: Column(
//         children: <Widget>[
//           _buildCompanyName(),
//           _buildModel(),
//           _buildRegNum(),
//           _buildUseName(),
//           _buildAddress(),
//           _buildRemarks(),
//         ],
//       ),
//     );
//   }

//   Future getImage(int i) async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       switch (i) {
//         case 0:
//           _fullimage = image;
//           break;
//         case 1:
//           _frontimage = image;
//           break;
//         case 2:
//           _backimage = image;
//           break;
//         default:
//       }
//     });
//   }

//   Widget _buildFormPict() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   getImage(0);
//                 },
//                 child: ClipRRect(
//                   child: new SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     height: MediaQuery.of(context).size.width * 0.2,
//                     child: (_fullimage != null)
//                         ? Image.file(
//                             _fullimage,
//                             fit: BoxFit.fill,
//                           )
//                         : Image.asset(
//                             'images/empty-picture.png',
//                             fit: BoxFit.fill,
//                           ),
//                   ),
//                 ),
//               ),
//               Text('Full Image'),
//             ],
//           ),
//         ),
//         Container(
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   getImage(1);
//                 },
//                 child: ClipRRect(
//                   child: new SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     height: MediaQuery.of(context).size.width * 0.2,
//                     child: (_frontimage != null)
//                         ? Image.file(
//                             _frontimage,
//                             fit: BoxFit.fill,
//                           )
//                         : Image.asset(
//                             'images/empty-picture.png',
//                             fit: BoxFit.fill,
//                           ),
//                   ),
//                 ),
//               ),
//               Text('Front Image'),
//             ],
//           ),
//         ),
//         Container(
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   getImage(2);
//                 },
//                 child: ClipRRect(
//                   child: new SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     height: MediaQuery.of(context).size.width * 0.2,
//                     child: (_backimage != null)
//                         ? Image.file(
//                             _backimage,
//                             fit: BoxFit.fill,
//                           )
//                         : Image.asset(
//                             'images/empty-picture.png',
//                             fit: BoxFit.fill,
//                           ),
//                   ),
//                 ),
//               ),
//               Text('Back Image'),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         Text('Booking Date: 8/7/20'),
//         Text('Handover Date: 8/7/20'),
//         Text('Remaining Time: 3 days 20 hour'),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   'images/logo.png',
//                   width: 100,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.48,
//                       alignment: Alignment.center,
//                       child: _buildFormText(),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       alignment: Alignment.center,
//                       child: _buildFormPict(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
