import 'package:flutter/material.dart';
// import 'package:baarbo/constants.dart';
// import '../widgets/main_drawer.dart';
// import '../screens/bottom_navigation.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
// import '../screens/search_store_screen.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/Account';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Account',
        style: TextStyle(color: Colors.white),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}
