import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookSignIn = new FacebookLogin();

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

Future<Null> fLogin() async {
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

Future<void> fSignOut() async {
  await firebaseAuth.signOut();
  await facebookSignIn.logOut();
  print('Đã đăng xuất Facebook');
}
