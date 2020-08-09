// import 'package:flutter/material.dart';
// import './auth_screen2.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ProductsOverviewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FlutterChat'),
//         actions: [
//           DropdownButton(
//             underline: Container(),
//             icon: Icon(
//               Icons.more_vert,
//               color: Theme.of(context).primaryIconTheme.color,
//             ),
//             items: [
//               DropdownMenuItem(
//                 child: Container(
//                   child: Row(
//                     children: <Widget>[
//                       Icon(Icons.exit_to_app),
//                       SizedBox(width: 8),
//                       Text('Logout'),
//                     ],
//                   ),
//                 ),
//                 value: 'logout',
//               ),
//             ],
//             onChanged: (itemIdentifier) {
//               if (itemIdentifier == 'logout') {
//                 FirebaseAuth.instance.signOut();
//               }
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: FlatButton(
//           child: Text('Logout'),
//           onPressed: () =>
//               Navigator.of(context).pushReplacementNamed(AuthScreen.routeName),
//         ),
//       ),
//     );
//   }
// }
