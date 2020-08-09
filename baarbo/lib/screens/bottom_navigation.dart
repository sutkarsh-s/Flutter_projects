// // import 'package:baarbo/screens/settings_screen.dart';
// // import 'package:baarbo/screens/tabs_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:baarbo/widgets/main_drawer.dart';
// import 'package:baarbo/constants.dart';
// import '../widgets/main_drawer.dart';
// // import '../constants.dart';
// import '../screens/account_screen.dart';
// import './contact_screen.dart';
// import './coupons_screen.dart';
// import 'package:baarbo/screens/home_overview_screen.dart';

// class BottomNavigation extends StatefulWidget {
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   List<Map<String, Object>> _pages;
//   int _selectedPageIndex = 0;
//   bool _tap = true;

//   // _pages = [

//   @override
//   void initState() {
//     _pages = [
//       {
//         'page': CatalogueScreen(),
//         'title': 'Home',
//       },
//       {
//         'page': CouponsScreen(),
//         'title': 'Coupons',
//       },
//       {
//         'page': ContactScreen(),
//         'title': 'Contact',
//       },
//       {
//         'page': AccountScreen(),
//         'title': 'Account',
//       },
//     ];

//     // bool _tap = true;

//     super.initState();
//   }

//   void _selectPage(int index) {
//     _tap = false;
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(_tap);
//     if (!_tap)
//       return SafeArea(
//         child: Scaffold(
//           backgroundColor: kBackgroundBlack,
//           appBar: AppBar(
//             title: Text(_pages[_selectedPageIndex]['title']),
//           ),
//           drawer: MainDrawer(),
//           body: bodyContent,
//           bottomNavigationBar: bottomNavigationBar,
//         ),
//       );
//     else
//       return bottomNavigationBar;
//   }

//   Widget get bodyContent {
//     return _pages[_selectedPageIndex]['page'];
//   }

//   Widget get bottomNavigationBar {
//     return ClipRRect(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(30),
//         topLeft: Radius.circular(30),
//       ),
//       child: BottomNavigationBar(
//         onTap: _selectPage,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectedPageIndex,
//         // type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(
//               Icons.collections,
//               color: Colors.black,
//             ),
//             title: Text('Coupons'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(
//               Icons.call,
//               color: Colors.black,
//             ),
//             title: Text('Contact'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(
//               Icons.account_circle,
//               color: Colors.black,
//             ),
//             title: Text('Account'),
//           ),
//         ],
//       ),
//     );
//   }
// }
