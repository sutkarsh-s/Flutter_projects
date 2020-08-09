// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CurrentUser extends ChangeNotifier {
//   String _uid;
//   String _email;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   final _firestore = Firestore.instance;

//   String get getUid => _uid;
//   String get getEmail => _email;

//   Future<String> onStartup() async {
//     String retval = 'error';
//     try {
//       FirebaseUser _firebaseUser = await _auth.currentUser();
//       _uid = _firebaseUser.uid;
//       _email = _firebaseUser.email;
//       retval = 'success';
//     } catch (e) {
//       print(e);
//     }
//     return retval;
//   }

//   Future<String> signOut() async {
//     String retVal = 'success';
//     try {
//       await _auth.signOut();
//       _uid = null;
//       _email = null;
//       retVal = 'success';
//     } catch (e) {
//       print(e);
//     }
//     return retVal;
//   }

//   Future<String> signUpUser(
//       String email, String password, bool isService) async {
//     String retVal = 'error';

//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       retVal = "success";
//       _firestore.collection('users').document('$email').setData({
//         'isService': isService,
//         'image':
//             'https://firebasestorage.googleapis.com/v0/b/fiklu-e12ce.appspot.com/o/images%2Fdefault-user-profile.png?alt=media&token=a5b207ba-7433-4745-af48-c4514eed7811'
//       });
//     } catch (e) {
//       retVal = e.message;
//     }

//     return retVal;
//   }

//   Future<String> logInUserwithEmail(String email, String password) async {
//     String retVal = 'error';

//     try {
//       AuthResult _authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       _uid = _authResult.user.uid;
//       _email = _authResult.user.email;
//       retVal = 'success';
//     } catch (e) {
//       retVal = e.message;
//     }
//     return retVal;
//   }

//   Future<bool> checkExist(String docID) async {
//     bool exists = false;
//     try {
//       await _firestore.document("users/$docID").get().then((doc) {
//         if (doc.exists)
//           exists = true;
//         else
//           exists = false;
//       });
//       return exists;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> checkService(String docID) async {
//     bool isService = false;
//     try {
//       await _firestore
//           .document('users/$docID')
//           .get()
//           .then((doc) => isService = doc.data['isService']);
//     } catch (e) {
//       print(e);
//     }
//     return isService;
//   }

//   Future<String> logInUserwithGoogle(bool isService) async {
//     String retVal = 'error';
//     GoogleSignIn _googleSignIn = GoogleSignIn(
//       scopes: [
//         'email',
//         'https://www.googleapis.com/auth/contacts.readonly',
//       ],
//     );

//     try {
//       GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
//       GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//           idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
//       AuthResult _authResult = await _auth.signInWithCredential(credential);

//       _uid = _authResult.user.uid;
//       _email = _authResult.user.email;
//       retVal = 'success';
//       bool exists = await checkExist(_email);
//       if (!exists) {
//         _firestore.collection('users').document('$_email').setData({
//           'isService': isService,
//           'image':
//               'https://firebasestorage.googleapis.com/v0/b/fiklu-e12ce.appspot.com/o/images%2Fdefault-user-profile.png?alt=media&token=a5b207ba-7433-4745-af48-c4514eed7811'
//         });
//       }
//     } catch (e) {
//       retVal = e.message;
//     }
//     return retVal;
//   }
// }
