import 'package:flutter/material.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:history_quizz/services/auth/facebook_auth.dart';
import 'package:history_quizz/services/auth/google_auth.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'facebook_screen.dart';
import 'google_screen.dart';

class Reset extends StatefulWidget {
  static String id = 'reset_screen';
  bool isFacebookClicked = false;
  bool isGoogleClicked = false;

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    Color pColor = Theme.of(context).primaryColor;
    Color bColor = Color(0xFFCED7EC);
    loginFacebook() {
      if (isGoogleSigned == false) {
        if (isFacebookLogined == false) {
          setState(() {
            widget.isFacebookClicked = !widget.isFacebookClicked;
          });
          Navigator.of(context).pushNamed(FacebookUser.id);
        } else {
          showDialog(
              context: context,
              builder: (_) => EndDialog(
                    title: 'Xin lỗi',
                    content: 'Bạn không thể kết nối nữa',
                    onTap: () {
                      Navigator.of(context).pushNamed(WelcomePage.id);
                    },
                  ));
        }
      } else {
        showDialog(
            context: context,
            builder: (_) => EndDialog(
                  title: 'Xin lỗi',
                  content: 'Bạn không thể kết nối nữa',
                  onTap: () {
                    Navigator.of(context).pushNamed(WelcomePage.id);
                  },
                ));
      }
    }

    loginGoogle() {
      if (isFacebookLogined == false) {
        if (isGoogleSigned == false) {
          setState(() {
            widget.isGoogleClicked = !widget.isGoogleClicked;
          });
          Navigator.of(context).pushNamed(GoogleUser.id);
        } else {
          showDialog(
              context: context,
              builder: (_) => EndDialog(
                    title: 'Xin lỗi',
                    content: 'Bạn không thể kết nối nữa',
                    onTap: () {
                      Navigator.of(context).pushNamed(WelcomePage.id);
                    },
                  ));
        }
      } else {
        showDialog(
            context: context,
            builder: (_) => EndDialog(
                  title: 'Xin lỗi',
                  content: 'Bạn không thể kết nối nữa',
                  onTap: () {
                    Navigator.of(context).pushNamed(WelcomePage.id);
                  },
                ));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: bColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn đã hết điểm !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: pColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50.0,
                        width: 150,
                        child: FlatButton(
                          onPressed: () {
                            loginFacebook();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              side: BorderSide(color: pColor, width: 3.0)),
                          color: (widget.isFacebookClicked) ? pColor : bColor,
                          child: Text(
                            'Facebook',
                            style: TextStyle(
                                color: (widget.isFacebookClicked)
                                    ? bColor
                                    : pColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 160,
                        child: FlatButton(
                          onPressed: () {
                            loginGoogle();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              side: BorderSide(color: pColor, width: 3.0)),
                          color: (widget.isGoogleClicked) ? pColor : bColor,
                          child: Text(
                            'Google',
                            style: TextStyle(
                                color:
                                    (widget.isGoogleClicked) ? bColor : pColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
