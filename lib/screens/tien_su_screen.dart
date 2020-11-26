import 'dart:async';

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
  Timer _timer;
  int _start = 30;

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
            (Timer timer) =>
            setState(
                  () {
                if (_start < 1) {
                  timer.cancel();
                } else {
                  _start = _start - 1;
                }
              },
            ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.all(20.0),
            child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Header(
                        timeRemain: '$_start',
                        lifeRemain: quizzdata.score.toString(),
                      ),
                      Provider
                          .of<QuizzData>(context)
                          .question[QuizzData.index],
                      Padding(padding: EdgeInsets.only(top: 35.0)),
                      Provider
                          .of<QuizzData>(context)
                          .answer[QuizzData.index],
                    ],
                  ),
                )),
          ),
        );
      },

    );
  }
}
