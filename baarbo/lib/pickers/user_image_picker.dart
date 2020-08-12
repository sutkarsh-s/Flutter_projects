import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _pickImage(bool camera) async {
    final picker = ImagePicker();
    if (camera) {
      final pickedImage = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth: 150,
      );
      if (pickedImage != null) {
        final pickedImageFile = File(pickedImage.path);
        setState(() {
          _pickedImage = pickedImageFile;
        });
        widget.imagePickFn(pickedImageFile);
      }
      // if (pickedImage == null) {
      //   Scaffold.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(
      //         'No Image Selected!',
      //         textAlign: TextAlign.center,
      //       ),
      //       duration: Duration(seconds: 2),
      //       backgroundColor: Colors.black,
      //     ),
      //   );
      // }
    } else {
      final pickedImage = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 150,
      );
      if (pickedImage != null) {
        final pickedImageFile = File(pickedImage.path);
        setState(() {
          _pickedImage = pickedImageFile;
        });
        widget.imagePickFn(pickedImageFile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      key: _scaffoldKey,
      child: Stack(
        children: [
          buildHeader(context),
          Positioned(
            top: 115,
            left: 85,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.teal[300],
              radius: 25,
              child: IconButton(
                padding: EdgeInsets.all(5),
                icon: Icon(FontAwesomeIcons.camera),
                color: Colors.white,
                onPressed: () => _settingModalBottomSheet(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: _scaffoldKey.currentContext,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.blueGrey[900],
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Profile photo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.purple[400],
                              radius: 30,
                              child: Icon(FontAwesomeIcons.image),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 18),
                            ),
                          ],
                        ),
                        onTap: () => _pickImage(false),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown[400],
                              radius: 30,
                              child: Icon(FontAwesomeIcons.camera),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 18),
                            ),
                          ],
                        ),
                        onTap: () {
                          _pickImage(true);
                        },
                      ),
                    ],
                  ),
                ],
              ));
        });
  }

  buildHeader(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: _pickedImage != null
                ? FileImage(_pickedImage)
                : AssetImage("assets/images/empty_user.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}
