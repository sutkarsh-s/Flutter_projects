import 'package:flutter/material.dart';
// import 'package:baarbo/constants.dart';
// import '../widgets/main_drawer.dart';
// import '../screens/bottom_navigation.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
// import '../screens/search_store_screen.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/Contact';

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text("Contact"),
    //   // ),
    //   backgroundColor: kBackgroundBlack,
    //   drawer: MainDrawer(),
    //   body:
    return Center(
      child: Text(
        'Contact-us',
        style: TextStyle(color: Colors.white),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}
