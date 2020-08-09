// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// enum Field {
//   name,
//   address,
//   id,
// }

// class CenterUpdation extends StatefulWidget {
//   @override
//   _CenterUpdationState createState() => _CenterUpdationState();
// }

// class _CenterUpdationState extends State<CenterUpdation> {
//   File _image;

//   String centerName = "Center Name",
//       centerAddress = "Center Address",
//       centerId = "Center ID";

//   Future<bool> onPressed(String text, Field field) async {
//     final textController = TextEditingController();
//     textController.text = text;
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Change the field'),
//             content: TextField(
//               controller: textController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 20),
//               ),
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text('No'),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   switch (field) {
//                     case Field.name:
//                       centerName = textController.text.trim();
//                       break;
//                     case Field.address:
//                       centerAddress = textController.text.trim();
//                       break;
//                     default:
//                   }
//                   textController.dispose();
//                   Navigator.pop(context);
//                 },
//                 child: Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   Widget _detailTile(String text, Field field) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//       child: GestureDetector(
//         onTap: () {
//           if (field != Field.id) {
//             onPressed(text, field);
//           }
//         },
//         child: Row(
//           children: <Widget>[
//             Icon(
//               Icons.adjust,
//               color: themeYellow,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               text,
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image;
//       print('Image Path $_image');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Image.asset(
//               'images/logo.png',
//               width: 100,
//             ),
//             Text(
//               'CENTER UPDATION',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 getImage();
//               },
//               child: ClipRRect(
//                 child: new SizedBox(
//                   width: 180.0,
//                   height: 180.0,
//                   child: (_image != null)
//                       ? Image.file(
//                           _image,
//                           fit: BoxFit.fill,
//                         )
//                       : Image.asset(
//                           'images/empty-picture.png',
//                           fit: BoxFit.fill,
//                         ),
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   _detailTile(centerName, Field.name),
//                   _detailTile(centerAddress, Field.address),
//                   _detailTile(centerId, Field.id),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
