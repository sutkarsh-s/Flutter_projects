// import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../widgets/main_drawer.dart';
// import '../screens/bottom_navigation.dart';
// import '../screens/search_store_screen.dart';

class CouponsScreen extends StatelessWidget {
  static const routeName = '/Coupons';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Coupons',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    // bottomNavigationBar: TabsScreen()
  }
}
