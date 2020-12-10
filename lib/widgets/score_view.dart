import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:provider/provider.dart';

class ScoreView extends StatefulWidget {
  const ScoreView({
    Key key,
  }) : super(key: key);

  @override
  _ScoreViewState createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child){
        return Padding(
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
                  (quizzdata.score >= 0) ? '${quizzdata.score}' : '0',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 33.0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}