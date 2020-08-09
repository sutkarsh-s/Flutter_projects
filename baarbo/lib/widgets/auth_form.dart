// import 'dart:io';
// import 'package:baarbo/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../screens/auth_screen2.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    String phoneNumber,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _contactNumber = '';

  final _passwordController = TextEditingController();
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _contactNumber.trim(), _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // var h1;
    // _isLogin
    //     ? h1 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.17
    //     : h1 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.1;
    // var h2;
    // _isLogin
    //     ? h2 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.83
    //     : h2 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.9;
    // var h3;
    // _isLogin
    //     ? h3 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.14
    //     : h3 = (MediaQuery.of(context).size.height -
    //             MediaQuery.of(context).padding.top) *
    //         0.08;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundBlack,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.17,
              width: deviceSize.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.13,
                      child: Image.asset(
                        './assets/images/logo.png',
                      )),
                  // SizedBox(
                  //   height: 40,
                  // ),
                ],
              ),
            ),
            // SingleChildScrollView(  ///// was breaking the scrolling when opening keyboard
            // child:
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.83,
              width: deviceSize.width,
              //margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                //  needed for overflow in landscpe and signup
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   // height: 500,
                    //   child:
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 8,
                        // child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: _isLogin ? 15 : 5,
                              ),
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                              SizedBox(
                                height: _isLogin ? 10 : 5,
                              ),
                              Text(
                                'Sign up to get started',
                                style: TextStyle(
                                    color: Colors.grey,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: _isLogin ? 20 : 5,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFormField(
                                      key: ValueKey('email'),
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            !value.contains('@')) {
                                          return 'Please enter a valid email address.';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Email address',
                                      ),
                                      onSaved: (value) {
                                        _userEmail = value;
                                      },
                                    ),
                                    if (!_isLogin)
                                      TextFormField(
                                        key: ValueKey('username'),
                                        autocorrect: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        // controller: _passwordController,
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value.length < 4) {
                                            return 'Please enter at least 4 characters';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Username'),
                                        onSaved: (value) {
                                          _userName = value;
                                        },
                                      ),
                                    TextFormField(
                                      key: ValueKey('password'),
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value.isEmpty || value.length < 7) {
                                          return 'Password must be at least 7 characters long.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Password'),
                                      obscureText: true,
                                      onSaved: (value) {
                                        _userPassword = value;
                                        print(_userPassword);
                                      },
                                    ),
                                    if (!_isLogin)
                                      TextFormField(
                                          // enabled: _authMode == AuthMode.Signup,
                                          decoration: InputDecoration(
                                              labelText: 'Confirm Password'),
                                          obscureText: true,
                                          validator: (value) {
                                            if (value !=
                                                _passwordController.text) {
                                              return 'Passwords do not match!';
                                            }
                                            return null;
                                          }),
                                    if (!_isLogin)
                                      TextFormField(
                                        key: ValueKey('Contact No.'),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter Phone Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Contact Number'),
                                        onSaved: (value) {
                                          _contactNumber = value;
                                        },
                                      ),
                                    SizedBox(height: 18),
                                    if (widget.isLoading)
                                      CircularProgressIndicator(),
                                    if (!widget.isLoading)
                                      RaisedButton(
                                        child: Text(
                                          _isLogin ? 'Sign In' : 'Signup',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: _trySubmit,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 125, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30),
                                        ),
                                        color: Colors.red,
                                      ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // )
                        )
                        // ),
                        ),
                    // ),
                    SizedBox(
                      height: _isLogin ? 20 : 0,
                    ),
                    Container(
                      width: deviceSize.width * 0.9,
                      // child: Expanded(
                      child: Column(
                        children: <Widget>[
                          if (_isLogin)
                            RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.red,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                bool res = await AuthScreen().loginwithGoogle();
                                if (!res) print('Error');
                              },
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40),
                              ),
                              color: Colors.brown[300],
                            ),
                          SizedBox(
                            height: _isLogin ? 8 : 0,
                          ),
                          if (_isLogin)
                            RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Sign in with Facebook',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () async {
                                bool res =
                                    await AuthScreen().logininwithFacebook();

                                if (!res) print('Error');
                              },
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40),
                              ),
                              color: Colors.green[300],
                            ),
                        ],
                      ),
                    ),
                    // ),
                    SizedBox(height: _isLogin ? 10 : 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (_isLogin)
                          Center(
                            child: Text('Don\'t have an account?'),
                          ),
                        // Expanded(
                        //     child:
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(_isLogin
                              ? 'Sign up'
                              : 'I already have an account'),
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                        )
                        // ),
                      ],
                    ),
                    // ),
                  ],
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    ));
    // );
  }
}
