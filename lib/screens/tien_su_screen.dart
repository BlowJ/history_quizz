import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/screens/tien_su_screen.dart';
import 'package:history_quizz/widgets/answer_cards.dart';
import 'package:history_quizz/widgets/answer_list.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/models/quizz_brain.dart';

class TienSu extends StatefulWidget {
  static const String id = 'tien_su_screen';

  @override
  _TienSuState createState() => _TienSuState();
}

class _TienSuState extends State<TienSu> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Header(
                timeRemain: '30',
                lifeRemain: '10',
              ),
              Provider.of<QuizzData>(context).question[QuizzData.index],
              Padding(padding: EdgeInsets.only(top: 35.0)),
              Provider.of<QuizzData>(context).answer[QuizzData.index],
            ],
          ),
        )),
      ),
    );
  }
}
