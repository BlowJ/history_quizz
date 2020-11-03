import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_quizz/widgets/subject_cards.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("Header"),
              ),
              ListTile(
                title: Text("Home"),
              )
            ],
          ),
        ),
        appBar: AppBar(
            leading: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Builder(
            builder: (context) => IconButton(
                icon: Icon(
                  Icons.dehaze,
                  size: 50.0,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          ),
        )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 70.0),
                  ),
                  Center(
                    child: Container(
                      height: 60.0,
                      width: 320.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(23.0),
                        color: Color(0xFF393737),
                        border: Border.all(
                          color: Color(0xFFFFFFFF),
                          width: 3.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Lịch Sử Việt Nam',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 37.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SubjectCard(
                      subjectImage: Colors.blue,
                      cardChild: Text('data'),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
