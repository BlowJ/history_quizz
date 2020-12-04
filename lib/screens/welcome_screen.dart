import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_quizz/models/quizz_brain.dart';
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
                                height: 400.0,
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
                                    GestureDetector(
                                      onTap: () {
                                        if (quizzdata.score > 0) {
                                          Navigator.pushNamed(
                                              context, StartGame.id);
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70.0),
                                        padding: EdgeInsets.only(
                                            left: 80.0, right: 5.0),
                                        height: 60.0,
                                        width: 280.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 6,
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                'Bắt đầu',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.lato(
                                                    fontSize: 32.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 50.0,
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Color(0xFFCED7EC),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.0))),
                                              child: Icon(
                                                FontAwesomeIcons.caretRight,
                                                size: 40.0,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            )
                                            // Container(
                                            //   height: 50.0,
                                            //   width: 50.0,
                                            //   padding:
                                            //       EdgeInsets.only(left: 8.0),
                                            //   decoration: BoxDecoration(
                                            //       shape: BoxShape.rectangle,
                                            //       color: Theme.of(context).primaryColor,
                                            //       borderRadius:
                                            //           BorderRadius.all(
                                            //               Radius.circular(
                                            //                   30.0)),
                                            //     border: Border.all(
                                            //       color: Color(0xFFCED7EC),
                                            //       width: 3.0,
                                            //       style: BorderStyle.solid
                                            //     )
                                            //   ),
                                            //
                                            //   child: Icon(
                                            //     FontAwesomeIcons.caretRight,
                                            //     size: 40.0,
                                            //     color: Color(0xFFCED7EC),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 50.0),
                                      child: Container(
                                        height: 120.0,
                                        width: 280.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 6,
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.0)),
                                            Text(
                                              'Điểm của bạn',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 12.0)),
                                            Text(
                                              '${quizzdata.score}',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 33.0,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
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
