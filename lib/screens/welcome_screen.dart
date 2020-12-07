import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/widgets/score_view.dart';
import 'package:history_quizz/widgets/start_button.dart';
import 'package:history_quizz/widgets/subject_cards.dart';
import 'package:history_quizz/widgets/drawer_list.dart';
import 'package:history_quizz/widgets/box_title.dart';
import 'package:history_quizz/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return Scaffold(
            drawer: Drawer(
              elevation: 100.0,
              child: DrawerList(),
            ),
            appBar: AppBar(
                leading: Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Builder(
                builder: (context) => IconButton(
                    icon: Icon(
                      Icons.dehaze,
                      size: 40.0,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
              ),
            )),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 70.0),
                        ),
                        Center(
                          child: BoxTitle(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90.0),
                        ),
                        Center(
                            child: Column(

                          children: <Widget>[
                            Container(
                                height: 460.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0)),
                                    color: Color(0xFFCED7EC)),
                                // child: SubjectCard(
                                //   cardImage: Image.asset(
                                //       'images/thoiphongkien.jpg'),
                                //   cardText: 'Bắt đầu',
                                //   onPressed: () {
                                //     if (quizzdata.score > 0) {
                                //       Navigator.pushNamed(context, StartGame.id);
                                //     }
                                //   },
                                // ),
                                child: Column(
                                  children: <Widget>[
                                    StartButton(),
                                    ScoreView()
                                  ],
                                )),
                          ],
                        )),
                      ]),
                ),
              ),
            ));
      },
    );
  }
}




