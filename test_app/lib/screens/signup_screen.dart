// import 'package:flutter/material.dart';
// import 'package:fiklu_app/current_user.dart';
// import 'package:provider/provider.dart';

// class SignUpScreen extends StatefulWidget {
//   final bool isService;
//   SignUpScreen({@required this.isService});
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void _signUpUser(String email, String password, BuildContext context,
//       bool isService) async {
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     try {
//       String _returnString =
//           await _currentUser.signUpUser(email, password, isService);
//       if (_returnString == 'success') {
//         Navigator.pop(context);
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//         builder: (context) => Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Image.asset('images/logo.png', width: 100),
//               Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.alternate_email),
//                   hintText: 'Email',
//                 ),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock_outline),
//                   hintText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   _signUpUser(
//                       _emailController.text.trim(),
//                       _passwordController.text.trim(),
//                       context,
//                       widget.isService);
//                 },
//                 elevation: 5.0,
//                 color: Colors.white70,
//                 child: Text('Sign up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
