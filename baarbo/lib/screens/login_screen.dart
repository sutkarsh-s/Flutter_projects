// import 'package:baarbo/screens/auth_screen2.dart';
import 'package:flutter/material.dart';
import 'package:baarbo/main.dart';
import '../constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var w;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    isLandscape ? w = deviceSize.width * 0.4 : w = deviceSize.width * 0.9;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundBlack,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    height: deviceSize.height * 0.15,
                    width: deviceSize.width * 0.6,
                    child: Image.asset(
                      './images/logo.png',
                    )),
                Column(
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign up to get started',
                      style: TextStyle(color: Colors.white.withOpacity(1.0)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: w,
                      child: RaisedButton(
                        child: Text("CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Raleway-Regular')),
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => Home()));
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40),
                        ),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          style:
                              TextStyle(color: Colors.white.withOpacity(1.0)),
                        ),
                        InkWell(
                          child: Text(
                            ' Sign in',
                            style:
                                TextStyle(color: Colors.blue.withOpacity(1.0)),
                          ),
                          onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => Home())),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
