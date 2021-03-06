import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:history_quizz/models/utils/score_data.dart';
import 'package:history_quizz/pages/main_screen.dart';
import 'package:provider/provider.dart';

class StartButton extends StatefulWidget {
  const StartButton({
    Key key,
  }) : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getScore(),
      builder: (context, snapshot) {
        return Consumer<QuizzData>(
          builder: (context, quizzdata, child) {
            return GestureDetector(
              onTap: () async {
                print('${snapshot.data.last.score}');
                quizzdata.score = int.parse(snapshot.data.last.score);
                print('${quizzdata.score}');
                if (quizzdata.score >= 1) {
                  Navigator.pushNamed(context, StartGame.id);
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.only(left: 80.0, right: 5.0),
                height: 60.0,
                width: 280.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Bắt đầu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            fontSize: 32.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      padding: EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFFCED7EC),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Icon(
                        FontAwesomeIcons.caretRight,
                        size: 40.0,
                        color: Theme.of(context).primaryColor,
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