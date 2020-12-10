import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookSignIn = new FacebookLogin();

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = new GoogleSignIn();

// Future<User> signInGoogle() async {
//   // Attempt to get the currently authenticated user
//   GoogleSignInAccount currentUser = googleSignIn.currentUser;
//   if (currentUser == null) {
//     // Attempt to sign in without user interaction
//     currentUser = await googleSignIn.signInSilently();
//   }
//   if (currentUser == null) {
//     // Force the user to interactively sign in
//     currentUser = await googleSignIn.signIn();
//   }
//
//   final GoogleSignInAuthentication googleAuth =
//   await currentUser.authentication;
//
//   // Authenticate with firebase
//   final GoogleAuthCredential user = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//   UserCredential userCredential =
//   await FirebaseAuth.instance.signInWithCredential(user);
//   assert(user != null);
//   // assert(!user.isAnonymous);
//
//   return userCredential.user;
// }

Future<Null> login() async {
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final FacebookAccessToken accessToken = result.accessToken;
      print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
      break;
    case FacebookLoginStatus.cancelledByUser:
      print('Login cancelled by the user.');
      break;
    case FacebookLoginStatus.error:
      print('Something went wrong with the login process.\n'
          'Here\'s the error Facebook gave us: ${result.errorMessage}');
      break;
  }
}
