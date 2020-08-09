// import 'dart:io';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/auth_form.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatefulWidget {
  static const routeName = '/Auth';
  final _auth = FirebaseAuth.instance;

  Future<bool> logininwithFacebook() async {
    try {
      final facebookLogin = FacebookLogin();

      final result = await facebookLogin.logIn(['email']);
      if (result == null) return false;
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
      print(graphResponse.body);
      if (result.status == FacebookLoginStatus.loggedIn) {
        final credential =
            FacebookAuthProvider.getCredential(accessToken: token);
        AuthResult res = await _auth.signInWithCredential(credential);

        if (res.user == null) return false;
      }
      return true;
    } catch (e) {
      print('Error Logging In with Facebook');
      return false;
    }
  }

  Future<bool> loginwithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) return false;
      AuthResult res =
          await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));

      if (res.user == null) return false;
      return true;
    } catch (e) {
      print('Error Logging In with Google');
      return false;
    }
  }

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
//   FirebaseUser user= FirebaseAuth.instance.currentUser();

//  if(user!=null){

//   Log.i("a user is logged in: ",user);
//  }
//   else{
//        Log.i("Username", "there is no user");
//      }
  void _submitAuthForm(
    String email,
    String password,
    String username,
    String phonenumber,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        //  } else if(isLogin)
        //  {
        //      authResult = await _auth.signInWIthGoogle(
        //     email: email,
        //     password: password,
        //   );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'username': username,
          'email': email,
          'phonenumber': phonenumber,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
