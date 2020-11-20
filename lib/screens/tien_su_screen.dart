import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/screens/tien_su_screen.dart';
import 'package:history_quizz/widgets/answer_cards.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/widgets/header.dart';

class TienSu extends StatefulWidget {
  static const String id = 'tien_su_screen';

  @override
  _TienSuState createState() => _TienSuState();
}

class _TienSuState extends State<TienSu> {
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
              QuestionCard(
                questionNumber: 'Câu 1',
                questionText:
                    'Cho đến nay, các nhà khảo cổ học đã tìm thấy dấu vết của người vượn Homo erectus trong một số hang động ở đâu ?',
              ),
              Padding(padding: EdgeInsets.only(top: 35.0)),
              AnswerCard(answerText: 'Lạng Sơn'),
              AnswerCard(answerText: 'Hà Nội'),
              AnswerCard(answerText: 'Lào Cai'),
              AnswerCard(answerText: 'Phú Yên'),
            ],
          ),
        )),
      ),
    );
  }
}
