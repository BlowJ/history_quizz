import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/models/utils/score_data.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:history_quizz/services/auth/facebook_auth.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:provider/provider.dart';

class FacebookUser extends StatefulWidget {
  static const String id = 'facebook_screen';

  @override
  _FacebookUserState createState() => _FacebookUserState();
}

class _FacebookUserState extends State<FacebookUser> {
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: (isFacebookLogined)
                      ? NetworkImage(
                          userProfile["picture"]["data"]["url"],
                        )
                      : AssetImage('images/avatar_default.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    (isFacebookLogined)
                        ? 'Welcome\n ${userProfile["name"]}'
                        : 'Welcome bạn ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 25.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0, top: 100.0),
                  child: ButtonTheme(
                    height: 60.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                        onPressed: () async {
                          if (Provider.of<QuizzData>(context, listen: false)
                                  .score <
                              0) {
                            Provider.of<QuizzData>(context, listen: false)
                                .score = 0;
                          }
                          await signInWithFacebook();
                          setState(() {
                            isFacebookLogined = !isFacebookLogined;
                          });

                          if (Provider.of<QuizzData>(context, listen: false)
                                  .score >
                              3) {
                            showDialog(
                                context: context,
                                builder: (_) => EndDialog(
                                  title: 'Xin lỗi',
                                  content: 'Bạn không thể nhận thêm điểm',
                                  onTap: () {
                                    newScore(
                                      Score(
                                          score:
                                          '${Provider.of<QuizzData>(context, listen: false).score}'),
                                    );
                                    Navigator.of(context)
                                        .pushNamed(WelcomePage.id);
                                  },
                                ));
                          } else {
                            Provider.of<QuizzData>(context, listen: false)
                                .score++;
                            showDialog(
                                context: context,
                                builder: (_) => EndDialog(
                                  title: 'Yeah',
                                  content: 'Tiếp tục nào',
                                  // backScreen: WelcomePage.id
                                  onTap: () {
                                    newScore(
                                      Score(
                                          score:
                                          '${Provider.of<QuizzData>(context, listen: false).score}'),
                                    );
                                    Navigator.of(context)
                                        .pushNamed(WelcomePage.id);
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
  }
}
