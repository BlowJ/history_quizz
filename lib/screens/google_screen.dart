import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/models/facebook_auth.dart';
import 'package:history_quizz/models/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/utils/score_data.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:provider/provider.dart';

class GoogleUser extends StatefulWidget {
  static const String id = 'google_screen';

  // bool isLogin = false;

  @override
  _GoogleUserState createState() => _GoogleUserState();
}

class _GoogleUserState extends State<GoogleUser> {
  @override
  void initState() {
    super.initState();
    // signInWithGoogle();
    setState(() {
      isGoogleSigned = !isGoogleSigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.all(15.0),
                height: 500.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFCED7EC),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: (isGoogleSigned)
                          ? NetworkImage(gUser.photoURL)
                          : AssetImage('images/avatar_default.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        (isGoogleSigned)
                            ? 'Welcome\n ${gUser.displayName}'
                            : 'Welcome bạn ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.0, top: 100.0),
                      child: ButtonTheme(
                        height: 60.0,
                        minWidth: 200.0,
                        child: RaisedButton(
                            onPressed: () {
                              if (Provider
                                  .of<QuizzData>(context, listen: false)
                                  .score > 3) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        EndDialog(
                                          title: 'Xin lỗi',
                                          content:
                                          'Bạn không thể nhận thêm điểm',
                                          onTap: () {
                                            newScore(
                                              Score(
                                                  score:
                                                  '${Provider
                                                      .of<QuizzData>(
                                                      context, listen: false)
                                                      .score}'),
                                            );
                                            Navigator.of(context).pushNamed(
                                                WelcomePage.id);
                                          },
                                        ));
                              } else {
                                Provider
                                    .of<QuizzData>(context, listen: false)
                                    .score++;
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        EndDialog(
                                          title: 'Yeah',
                                          content: 'Tiếp tục nào',
                                          // backScreen: WelcomePage.id
                                          onTap: () {
                                            newScore(
                                              Score(
                                                  score:
                                                  '${Provider
                                                      .of<QuizzData>(
                                                      context, listen: false)
                                                      .score}'),
                                            );
                                            Navigator.of(context).pushNamed(
                                                WelcomePage.id);
                                          },
                                        ));
                              }
                            },
                            onHighlightChanged: (value) => 2,
                            elevation: 12.0,
                            disabledElevation: 3.0,
                            focusElevation: 8.0,
                            highlightElevation: 10.0,
                            focusColor: Colors.blueGrey,
                            disabledTextColor: Colors.grey,
                            color: Theme.of(context).primaryColor,
                            disabledColor: Colors.grey,
                            textColor: Color(0xFFCED7EC),
                            child: Text(
                              'Nhận thêm điểm',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            shape: StadiumBorder(
                              side: BorderSide.none,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
