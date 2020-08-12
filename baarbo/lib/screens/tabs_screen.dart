import 'package:baarbo/screens/home_overview_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../constants.dart';

import './contact_screen.dart';
import 'profile_screen.dart';
import './coupons_screen.dart';
import '../screens/search_store_screen.dart';
//import '../widgets/home.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/Tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  bool _tap = true;

  @override
  void initState() {
    _pages = [
      {
        'page': CatalogueScreen(),
        'title': 'Home',
      },
      {
        'page': CouponsScreen(),
        'title': 'Coupons',
      },
      {
        'page': ContactScreen(),
        'title': 'Contact',
      },
      {
        'page': ProfileScreenTab(),
        'title': 'Profile',
      },
    ];

    // bool _tap = true;

    super.initState();
  }

  void _selectPage(int index) {
    _tap = false;
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_tap);
    if (!_tap)
      return Scaffold(
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
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
        body: bodyContent,
        bottomNavigationBar: bottomNavigationBar,
      );
    else
      return bottomNavigationBar;
  }

  Widget get bodyContent {
    return _pages[_selectedPageIndex]['page'];
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.collections,
              color: Colors.black,
            ),
            title: Text('Coupons'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.call,
              color: Colors.black,
            ),
            title: Text('Contact'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
