// import 'package:baarbo/screens/tabs_screen.dart';
import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
// import '../screens/bottom_navigation.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
import '../screens/search_store_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/Settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    print('hello');
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
        body: Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}
