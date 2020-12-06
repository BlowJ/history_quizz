import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  print('googleUser: $googleUser');
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  print('googleAuth: $googleAuth');
  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print('googleAuth.accessToken: ${googleAuth.accessToken}');
  print('googleAuth.idToken: ${googleAuth.idToken}');
  print('credential: $credential');
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print('userCredential: $userCredential');
  // Once signed in, return the UserCredential
  return userCredential;
}
