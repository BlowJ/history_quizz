import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_quizz/widgets/drawer_list_titles.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/models/quizz_brain.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerList createState() => _DrawerList();
}

class _DrawerList extends State<DrawerList> {
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
                                  image: AssetImage('images/avatar.jpg'),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Text(
                              'Xin chào Long',
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
                      children: <Widget>[
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.facebookF,
                          titleText: 'Kết nối Facebook',
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.google,
                          titleText: 'Kết nối Google',
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.tasks,
                          titleText: 'Kiểm tra tiến độ',
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.info,
                          titleText: 'Kết nối Facebook',
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.reply,
                          titleText: 'Chơi lại',
                          onClick: () {
                            setState(() {
                              quizzdata.resetQuestion(0);
                            });
                          },
                        ),
                        DrawerListTitle(
                          pColor: pColor,
                          leadIcon: FontAwesomeIcons.signOutAlt,
                          titleText: 'Thoát',
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
