import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/models/utils/score_data.dart';
import 'package:history_quizz/pages/facebook_screen.dart';
import 'package:history_quizz/pages/google_screen.dart';
import 'package:history_quizz/pages/reset_screen.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:history_quizz/services/auth/facebook_auth.dart';
import 'package:history_quizz/services/auth/google_auth.dart';
import 'package:history_quizz/widgets/drawer_list_titles.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:provider/provider.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerList createState() => _DrawerList();
}

class _DrawerList extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    Color pColor = Theme.of(context).primaryColor;
    return FutureBuilder<List>(
      future: getScore(),
      builder: (context, snapshot) {
        return Consumer<QuizzData>(
          builder: (context, quizzdata, child) {
            getUserImage() {
              if (isGoogleSigned == true) {
                return NetworkImage('${gUser.photoURL}');
              } else if (isFacebookLogined == true) {
                return NetworkImage(userProfile["picture"]["data"]["url"]);
              } else {
                return AssetImage('images/avatar_default.png');
              }
            }

            ;
            getUserName() {
              if (isGoogleSigned == true) {
                return 'Xin chào ${gUser.displayName}';
              } else if (isFacebookLogined == true) {
                return 'Xin chào ${(userProfile["name"])}';
              } else {
                return 'Xin chào bạn';
              }
            }

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
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: getUserImage(),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15.0)),
                                Text(
                                  getUserName(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
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
                                if (isFacebookLogined == false) {
                                  Navigator.of(context)
                                      .pushNamed(FacebookUser.id);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => EndDialog(
                                            title: 'Xin lỗi',
                                            content:
                                                'Bạn không thể kết nối nữa',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                }
                              },
                            ),
                            DrawerListTitle(
                              pColor: pColor,
                              leadIcon: FontAwesomeIcons.google,
                              titleText: 'Kết nối Google',
                              onClick: () {
                                if (isGoogleSigned == false) {
                                  Navigator.of(context)
                                      .pushNamed(GoogleUser.id);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => EndDialog(
                                            title: 'Xin lỗi',
                                            content:
                                                'Bạn không thể kết nối nữa',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                }
                              },
                            ),
                            DrawerListTitle(
                              pColor: pColor,
                              leadIcon: FontAwesomeIcons.reply,
                              titleText: 'Chơi lại',
                              onClick: () {
                                quizzdata.score =
                                    int.parse(snapshot.data.last.score);
                                if (quizzdata.score < 1) {
                                  Navigator.of(context).pushNamed(Reset.id);
                                }
                              },
                            ),
                            DrawerListTitle(
                              pColor: pColor,
                              leadIcon: FontAwesomeIcons.signOutAlt,
                              titleText: 'Đăng xuất Google',
                              onClick: () {
                                if (isGoogleSigned == true) {
                                  signOutGoogle();
                                  setState(() {
                                    isGoogleSigned = !isGoogleSigned;
                                    isFacebookLogined = false;
                                  });
                                  Navigator.of(context)
                                      .pushNamed(WelcomePage.id);
                                  showDialog(
                                      context: context,
                                      builder: (_) => EndDialog(
                                            title: ' ',
                                            content: 'Bạn đã đăng xuất Google',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => EndDialog(
                                            title: 'Xin lỗi',
                                            content: 'Bạn chưa kết nối Google',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                }
                              },
                            ),
                            DrawerListTitle(
                              pColor: pColor,
                              leadIcon: FontAwesomeIcons.signOutAlt,
                              titleText: 'Đăng xuất Facebook',
                              onClick: () {
                                if (isFacebookLogined == true) {
                                  signOutFacebook();
                                  setState(() {
                                    isFacebookLogined = !isFacebookLogined;
                                    isGoogleSigned = false;
                                  });
                                  Navigator.of(context)
                                      .pushNamed(WelcomePage.id);
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          EndDialog(
                                            title: ' ',
                                            content:
                                            'Bạn đã đăng xuất Facebook',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                }
                                else {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          EndDialog(
                                            title: 'Xin lỗi',
                                            content:
                                            'Bạn chưa kết nối Facebook',
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(WelcomePage.id);
                                            },
                                          ));
                                }
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
                                          '${Provider.of<QuizzData>(context, listen: false).score}'),
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
      },
    );
  }
}
