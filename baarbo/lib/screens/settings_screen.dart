// import 'package:baarbo/screens/tabs_screen.dart';
import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
import 'package:baarbo/constants.dart';
import 'package:flutter/material.dart';
import '../utils/CustomTextStyle.dart';
import '../models/list_profile_section.dart';
import '../pages/NotificationPage.dart';
import '../pages/InviteFriendsPage.dart';
import '../pages/AboutUsPage.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';
import './profile_screen.dart';
import '../screens/search_store_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/Settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<ListSettingSection> listSection = new List();
  String ProfileStatus = '***********';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  String name = "";
  String userid = "";

  // final user = FirebaseAuth.instance.currentUser().then((value) {
  //   print('2222222222222222222');
  //   print(value.email);
  //   String id = value.uid;
  //   print(id);
  //   return Firestore.instance.collection('users').document(id).get();
  // }).then((value) {
  //   String na = value['displayName'];
  //   print(na);
  // });

  @override
  void initState() {
    super.initState();
    createListItem();
    _getCurrentUser();
    print('here outside async');
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    print(currentUser.email);
    userid = currentUser.uid;
    final userData =
        await Firestore.instance.collection('users').document(userid).get();
    setState(() {
      name = userData['displayName'];
    });
  }

  void createListItem() {
    listSection.add(createSection("Notifications", "images/ic_notification.png",
        Colors.blue.shade800, "Message,tone", NotificationPage()));
    listSection.add(createSection("Payment Method", "images/ic_payment.png",
        Colors.teal.shade800, "Debit Card, Credit Card", null));
    listSection.add(createSection("Account", "images/ic_settings.png",
        Colors.red.shade800, "Privacy, security, change number", null));
    listSection.add(createSection(
        "Help",
        "images/ic_invite_friends.png",
        Colors.indigo.shade800,
        "FAQ, contact us, privacy policy",
        InviteFriendsPage()));
    listSection.add(createSection(
        "Invite Friends",
        "images/ic_invite_friends.png",
        Colors.indigo.shade800,
        "",
        InviteFriendsPage()));
  }

  createSection(String title, String icon, Color color, String description,
      Widget widget) {
    return ListSettingSection(title, icon, color, description, widget);
  }

  @override
  Widget build(BuildContext context) {
    print(ProfileStatus);
    print('111111111111111111');
    if (userid != '') {
      return SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
          title: Text("Settings"),
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
        drawer: MainDrawer(),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 24),
            buildHeader(),
            SizedBox(height: 24),
            buildListView()
          ],
        ),
        bottomNavigationBar: TabsScreen(),
      ));
    } else
      return SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundBlack,
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ));
  }

  buildHeader() {
    print('+++++++++++++++++++++++++');
    return InkWell(
      splashColor: Colors.brown[200],
      onTap: () {
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      },
      child: Container(
        child: Row(
          children: <Widget>[
            SizedBox(width: 14),
            Container(
              width: 60,
              margin: EdgeInsets.only(top: 8),
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/empty_user.png"),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // currentUser.displayName,
                        // snapshot.data.document
                        name,
                        textAlign: TextAlign.start,
                        style: CustomTextStyle.textFormFieldBlack
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 2),
                      Text(
                        currentUser.email,
                        style: CustomTextStyle.textFormFieldMedium.copyWith(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 100,
            )
          ],
        ),
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

  createListViewItem(ListSettingSection listSection) {
    print('&&&&&&&&&&&&&&&&&&&');
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.brown[200],
        onTap: () {
          if (listSection.widget != null) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => listSection.widget));
          }
        },
        child: Container(
          padding: EdgeInsets.only(top: 14, left: 24, right: 8, bottom: 14),
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            children: <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: listSection.color),
                  child: Image(
                    image: AssetImage(listSection.icon),
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listSection.title,
                              style: CustomTextStyle.textFormFieldMedium,
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
