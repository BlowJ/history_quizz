import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class StartGame extends StatefulWidget {
  static const String id = 'tien_su_screen';
  int index = 0;

  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  final StartGame = FirebaseFirestore.instance.collection('tien_su');

  Timer _timer;
  int _start = QuizzData().timer;

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
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
    return FutureBuilder<DocumentSnapshot>(
      future: StartGame.doc('c${QuizzData.index + 1}').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Đã xảy ra lỗi");
        }
        if (snapshot.hasData) {
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
                        // Provider
                        //     .of<QuizzData>(context)
                        //     .question[QuizzData.index],
                        QuestionCard(
                          questionNumber:
                              snapshot.data.data()['question_number'],
                          questionText: snapshot.data.data()['question_text'],
                        ),

                        Padding(padding: EdgeInsets.only(top: 35.0)),
                        // Provider
                        //     .of<QuizzData>(context)
                        //     .answer[QuizzData.index],
                        AnswerList(
                          answerText1: AnswerCard(
                            answer: snapshot.data.data()['answer'][0],
                            subject: 'tien_su',
                          ),
                          answerText2: AnswerCard(
                            answer: snapshot.data.data()['answer'][1],
                            subject: 'tien_su',
                          ),
                          answerText3: AnswerCard(
                            answer: snapshot.data.data()['answer'][2],
                            subject: 'tien_su',
                          ),
                          answerText4: AnswerCard(
                            answer: snapshot.data.data()['answer'][3],
                            subject: 'tien_su',
                          ),
                          correctAnswer: snapshot.data.data()['correct_answer'],
                        )
                      ],
                    ),
                  )),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFCED7EC)),
            backgroundColor: Theme.of(context).primaryColor,
            strokeWidth: 6.0,
          ),
        );
      },
    );
  }
}
