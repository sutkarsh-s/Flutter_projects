// import 'package:baarbo/screens/home_detail_screen.dart';
// import 'package:baarbo/screens/home_overview_screen.dart';
import 'package:baarbo/screens/home_overview_screen.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../screens/search_store_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/settings_screen.dart';
//import '../screens/home_overview_screen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import '../screens/auth_screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, String itemIdentifier, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: AssetImage(
                    //     'assets/images/logo.png',
                    //   ),
                    //   radius: 30,
                    // ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'BAARBA',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'www.baarba.com',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red[600],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Home', Icons.home, 'home', () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            }),
            buildListTile('search', Icons.search, 'search', () {
              Navigator.of(context).pushNamed(SearchStore.routeName);
            }),
            buildListTile('Cart', Icons.shopping_cart, 'cart', () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('Settings', Icons.settings, 'settings', () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
            }),
            buildListTile('Logout', Icons.exit_to_app, 'logout', () {
              // if (itemIdentifier == 'logout')
              {
                FirebaseAuth.instance.signOut();
              }
            }),
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                'Developed and maintained by Prixel Solutions',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
