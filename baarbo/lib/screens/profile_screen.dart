import 'package:baarbo/constants.dart';
import 'package:flutter/material.dart';
import '../pickers/user_image_picker.dart';
import 'dart:core';
import '../models/list_profile_section.dart';
import '../utils/CustomTextStyle.dart';
import 'dart:io';
// import 'dart:async';
import 'package:baarbo/screens/tabs_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
import '../constants.dart';
// import '../widgets/main_drawer.dart';
import '../extra-files/gender_palette.dart';
import 'search_store_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/Profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  List<ListProfileSection> listSection = new List();

  @override
  void initState() {
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection(
        "Name", kBackgroundBlack, Icons.person, "Utkarsh Singh", null));
    listSection.add(createSection(
        "Phone", kBackgroundBlack, Icons.call, "7380817952", null));
  }

  createSection(String title, Color color, IconData dicon, String description,
      Widget widget) {
    return ListProfileSection(title, color, dicon, description, widget);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: _scaffoldKey1,
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
          title: Text("Profile"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchStore.routeName);
                  },
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: ListView(
          // key: _scaffoldKey1,
          children: <Widget>[
            UserImagePicker(
              _pickedImage,
            ),
            SizedBox(height: 24),
            buildListView(),
            SizedBox(height: 5),
            GenderRow(),
            SizedBox(height: 5),
            Text(
              'You can change your Gender Preference',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.orange),
            )
          ],
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }

  ListView buildListView() {
    print('@@@@@@@@@@@@@@@@@');
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.brown[200],
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 14, left: 24, right: 8, bottom: 14),
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            children: <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    // color: listSection.color),
                  ),
                  child: Icon(
                    listSection.dicon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listSection.title,
                              style: CustomTextStyle.textFormFieldMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              listSection.description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              softWrap: true,
                            ),
                          ])))
            ],
          ),
        ),
      );
    });
  }
}

class ProfileScreenTab extends StatefulWidget {
  static const routeName = '/ProfileTab';
  @override
  _ProfileScreenTabState createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends State<ProfileScreenTab> {
  // final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  List<ListProfileSection> listSection = new List();

  @override
  void initState() {
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection(
        "Name", kBackgroundBlack, Icons.person, "Utkarsh Singh", null));
    listSection.add(createSection(
        "Phone", kBackgroundBlack, Icons.call, "7380817952", null));
  }

  createSection(String title, Color color, IconData dicon, String description,
      Widget widget) {
    return ListProfileSection(title, color, dicon, description, widget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // key: _scaffoldKey2,
      children: <Widget>[
        UserImagePicker(
          _pickedImage,
        ),
        SizedBox(height: 24),
        buildListView(),
        SizedBox(height: 5),
        GenderRow(),
        SizedBox(height: 5),
        Text(
          'You can change your Gender Preference',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.orange),
        )
      ],
    );
  }

  ListView buildListView() {
    print('@@@@@@@@@@@@@@@@@');
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.brown[200],
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 14, left: 24, right: 8, bottom: 14),
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            children: <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    // color: listSection.color),
                  ),
                  child: Icon(
                    listSection.dicon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listSection.title,
                              style: CustomTextStyle.textFormFieldMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              listSection.description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              softWrap: true,
                            ),
                          ])))
            ],
          ),
        ),
      );
    });
  }
}

// final ref = FirebaseStorage.instance
//     .ref()
//     .child('user_image')
//     .child(authResult.user.uid + '.jpg');

// await ref.putFile(image).onComplete;

// final url = await ref.getDownloadURL();

// await Firestore.instance
//     .collection('users')
//     .document(authResult.user.uid)
//     .setData({
//   'image_url': url,
// });
