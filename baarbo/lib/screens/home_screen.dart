import 'package:flutter/material.dart';
import '../lib/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBlack,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: 80,
                  child: Image.asset(
                    './images/logo.png',
                  )),
              Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline6,
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
                  RaisedButton(
                    child: Text("CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Regular')),
                    onPressed: () {},
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40),
                    ),
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white.withOpacity(1.0)),
                      ),
                      InkWell(
                        child: Text(
                          ' Sign in',
                          style: TextStyle(color: Colors.blue.withOpacity(1.0)),
                        ),
                        // onTap: () => ,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
