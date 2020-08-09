import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
// import '../screens/bottom_navigation.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
import '../screens/search_store_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
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
        backgroundColor: kBackgroundBlack,
        drawer: MainDrawer(),
        body: Center(
          child: Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}
