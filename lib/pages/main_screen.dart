import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/models/utils/score_data.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:history_quizz/views/answer_cards.dart';
import 'package:history_quizz/views/question_cards.dart';
import 'package:history_quizz/widgets/answer_list.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:history_quizz/widgets/header.dart';
import 'package:provider/provider.dart';

class StartGame extends StatefulWidget {
  static const String id = 'main_screen';

  Timer timer;
  int startSec = QuizzData().sec;
  int startMin = QuizzData().min;

  @override
  StartGameState createState() => StartGameState();
}

class StartGameState extends State<StartGame> {
  final StartGame = FirebaseFirestore.instance.collection('quizz_bank');

  void startTimer() {
    widget.timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          checkTimer();
        },
      ),
    );
  }

  void checkTimer() {
    if (widget.startMin < 1) {
      widget.startMin = 0;
      widget.startSec--;
      if (widget.startSec < 1) {
        widget.startSec = 0;
        widget.timer.cancel();
        Provider.of<QuizzData>(context, listen: false).score = 0;
        showDialog(
            context: context,
            builder: (_) => EndDialog(
                  title: 'Hic...',
                  content: 'Bạn đã hết thời gian',
                  onTap: () {
                    newScore(
                      Score(
                          score:
                              '${Provider.of<QuizzData>(context, listen: false).score}'),
                    );
                    print(getScore());
                    Navigator.of(context).pushNamed(WelcomePage.id);
                  },
                ));
      }
    } else {
      widget.startSec--;
      if (widget.startSec < 1) {
        widget.startMin = widget.startMin - 1;
        widget.startSec = 59;
      }
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: StartGame.doc('c${QuizzData.index + 1}').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          // FirebaseFirestore.instance.disableNetwork();
          // FirebaseFirestore.instance.settings =
          //     Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
          // FirebaseFirestore.instance.settings =
          //     Settings(persistenceEnabled: true);
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
                          time: '${widget.startMin} : ${widget.startSec}',
                        ),

                        QuestionCard(
                          questionNumber:
                              snapshot.data.data()['question_number'],
                          questionText: snapshot.data.data()['question_text'],
                        ),

                        Padding(padding: EdgeInsets.only(top: 35.0)),

                        AnswerList(
                          answerText1: AnswerCard(
                            answer: snapshot.data.data()['answer'][0],
                          ),
                          answerText2: AnswerCard(
                            answer: snapshot.data.data()['answer'][1],
                          ),
                          answerText3: AnswerCard(
                            answer: snapshot.data.data()['answer'][2],
                          ),
                          answerText4: AnswerCard(
                            answer: snapshot.data.data()['answer'][3],
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

  @override
  void dispose() {
    super.dispose();
    widget.timer.cancel();
  }
}
