import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_quizz/models/facebook_auth.dart';
import 'package:history_quizz/models/google_auth.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/screens/google_screen.dart';
import 'package:history_quizz/screens/reset_screen.dart';
import 'package:history_quizz/utils/score_data.dart';
import 'package:history_quizz/widgets/drawer_list_titles.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'endDialog.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerList createState() => _DrawerList();
}

class _DrawerList extends State<DrawerList> {
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final result = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);
  // }

  // Future<void> _login() async {
  //   try {
  //     // by default the login method has the next permissions ['email','public_profile']
  //     AccessToken accessToken = await FacebookAuth.instance.login();
  //     print(accessToken.toJson());
  //     // get the user data
  //     final userData = await FacebookAuth.instance.getUserData();
  //     print(userData);
  //   } on FacebookAuthException catch (e) {
  //     print(e.message);
  //     switch (e.errorCode) {
  //       case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
  //         print("You have a previous login operation in progress");
  //         break;
  //       case FacebookAuthErrorCode.CANCELLED:
  //         print("login cancelled");
  //         break;
  //       case FacebookAuthErrorCode.FAILED:
  //         print("login failed");
  //         break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color pColor = Theme.of(context).primaryColor;

    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 150.0,
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        decoration: BoxDecoration(color: pColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  // image: AssetImage('images/avatar.jpg'),
                                  image: isSigned
                                      ? NetworkImage('${gUser.photoURL}')
                                      : AssetImage('images/avatar.jpg'),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Text(
                              isSigned
                                  ? 'Xin chào ${gUser.displayName}'
                                  : 'Xin chào bạn',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 0.0,
                // ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(top: 50.0),
                    // height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFCED7EC),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.facebookF,
                          titleText: 'Kết nối Facebook',
                          onClick: () {
                            // signInWithFacebook();
                            // _login();
                            login();
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.google,
                          titleText: 'Kết nối Google',
                          onClick: () {
                            // signInWithGoogle();
                            Navigator.of(context).pushNamed(GoogleUser.id);
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.info,
                          titleText: 'Thông tin',
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.reply,
                          titleText: 'Chơi lại',
                          onClick: () {
                            setState(() {
                              quizzdata.resetQuizz();
                              newScore(
                                Score(
                                    score:
                                        '${Provider.of<QuizzData>(context, listen: false).score}'),
                              );
                              // Navigator.of(context).pushNamed(GoogleUser.id);
                              // Navigator.of(context).pushNamed(Reset.id);
                            });
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.signOutAlt,
                          titleText: 'Đăng xuất Google',
                          onClick: () {
                            setState(() {
                              signOutGoogle();
                            });
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.signOutAlt,
                          titleText: 'Đăng xuất Facebook',
                          onClick: () {
                            deleteScore();
                            // setState(() {
                            //   signOutGoogle();
                            // });
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.chevronCircleLeft,
                          titleText: 'Thoát',
                          onClick: () {
                            newScore(
                              Score(
                                  score:
                                  '${Provider
                                      .of<QuizzData>(context, listen: false)
                                      .score}'),
                            );
                            SystemNavigator.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
