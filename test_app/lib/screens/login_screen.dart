// import 'package:fiklu_app/screens/service_provider/provider_home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fiklu_app/current_user.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'signup_screen.dart';
// import 'user/user_home_screen.dart';

// enum LoginType {
//   email,
//   google,
// }

// class LoginScreen extends StatefulWidget {
//   final bool isService;
//   LoginScreen({@required this.isService});
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void _loginUser(
//       {@required LoginType type,
//       String email,
//       String password,
//       BuildContext context,
//       @required bool isService}) async {
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

//     try {
//       String _returnString;

//       switch (type) {
//         case LoginType.email:
//           _returnString =
//               await _currentUser.logInUserwithEmail(email, password);
//           break;
//         case LoginType.google:
//           _returnString = await _currentUser.logInUserwithGoogle(isService);
//           break;
//         default:
//       }

//       if (_returnString == 'success') {
//         if (await _currentUser.checkService(_currentUser.getEmail)) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => ProviderHomeScreen()),
//               (route) => false);
//         } else {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => UserHomeScreen()),
//               (route) => false);
//         }
//       } else {
//         Scaffold.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_returnString),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Widget _googleButton(bool isService) {
//     return OutlineButton(
//       splashColor: Colors.grey,
//       onPressed: () {
//         _loginUser(
//             type: LoginType.google, context: context, isService: isService);
//       },
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       highlightElevation: 0,
//       borderSide: BorderSide(color: Colors.grey),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'images/google-logo.jpg',
//               height: 25,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => new AlertDialog(
//             title: new Text('Are you sure?'),
//             content: new Text('Do you want to exit an App'),
//             actions: <Widget>[
//               new FlatButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: new Text('No'),
//               ),
//               new FlatButton(
//                 onPressed: () => SystemNavigator.pop(),
//                 child: new Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         body: Builder(
//           builder: (context) => Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset('images/logo.png', width: 100),
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.alternate_email),
//                     hintText: 'Email',
//                   ),
//                 ),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock_outline),
//                     hintText: 'Password',
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     _loginUser(
//                         type: LoginType.email,
//                         email: _emailController.text.trim(),
//                         password: _passwordController.text.trim(),
//                         context: context,
//                         isService: widget.isService);
//                   },
//                   elevation: 5.0,
//                   color: Colors.white70,
//                   child: Text('login'),
//                 ),
//                 MaterialButton(
//                   elevation: 5.0,
//                   color: Colors.white70,
//                   child: Text("Don't have an account? Sign up here"),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => SignUpScreen(
//                           isService: widget.isService,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 _googleButton(widget.isService),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
