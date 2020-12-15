import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

final FacebookLogin facebookSignIn = new FacebookLogin();

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

Map userProfile;

bool isFacebookLogined = false;

Future<Null> signInWithFacebook() async {
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final accessToken = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${accessToken}');
      final profile = JSON.jsonDecode(graphResponse.body);
      print('''
         Logged in!
          
          $profile
         ''');
      userProfile = profile;
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

Future<void> signOutFacebook() async {
  await firebaseAuth.signOut();
  await facebookSignIn.logOut();
  print('Đã đăng xuất Facebook');
}
