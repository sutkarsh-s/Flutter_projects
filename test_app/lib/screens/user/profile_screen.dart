// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fiklu_app/constants.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fiklu_app/current_user.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   bool isPhotoChanged = false;
//   File _image;
//   Image initialImage = Image.asset('images/profile-inactive.png');
//   final _storage = FirebaseStorage.instance;
//   final _firestore = Firestore.instance;

//   @override
//   void initState() {
//     super.initState();
//     downloadImage();
//   }

//   Future<void> uploadPic(File image) async {
//     //Create a reference to the location you want to upload to in firebase

//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     StorageReference reference =
//         _storage.ref().child("images/${_currentUser.getEmail}-profile.png");
//     //Upload the file to firebase
//     StorageUploadTask uploadTask = reference.putFile(image);

//     // Waits till the file is uploaded then stores the download url
//     var storageTaskSnapshot = await uploadTask.onComplete;
//     var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

//     print(downloadUrl);
//     await _firestore
//         .collection('users')
//         .document('${_currentUser.getEmail}')
//         .updateData({'image': downloadUrl});
//     //returns the download url
//     // return downloadUrl;
//   }

//   Future<void> downloadImage() async {
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     String url;
//     await _firestore
//         .document('users/${_currentUser.getEmail}')
//         .get()
//         .then((doc) {
//       url = doc.data['image'];
//     });
//     setState(() {
//       Image image = Image.network('$url');
//       initialImage = (image == null) ? initialImage : image;
//     });
//   }

//   Future getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _image = image;
//         isPhotoChanged = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     return Scaffold(
//       backgroundColor: themeLightYellow,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Image.asset('images/logo.png', width: 100),
//             Container(
//               child: Stack(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.center,
//                     child: CircleAvatar(
//                       radius: 100,
//                       backgroundColor: themeYellow,
//                       child: ClipOval(
//                         child: new SizedBox(
//                           width: 180.0,
//                           height: 180.0,
//                           child: (isPhotoChanged)
//                               ? (Image.file(
//                                   _image,
//                                   fit: BoxFit.fill,
//                                 ))
//                               : initialImage,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 30,
//                     top: 30,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 60.0),
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.edit,
//                           size: 30.0,
//                         ),
//                         onPressed: () {
//                           getImage();
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text('E-mail: ${_currentUser.getEmail}'),
//                 ],
//               ),
//             ),
//             isPhotoChanged
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.all(20),
//                         child: MaterialButton(
//                           onPressed: () async {
//                             await uploadPic(_image);
//                             await downloadImage();
//                             setState(() {
//                               isPhotoChanged = false;
//                             });
//                           },
//                           elevation: 5.0,
//                           color: Colors.white70,
//                           child: Text('Change'),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(20),
//                         child: MaterialButton(
//                           onPressed: () {
//                             setState(() {
//                               isPhotoChanged = false;
//                             });
//                           },
//                           elevation: 5.0,
//                           color: Colors.white70,
//                           child: Text('Cancel'),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
