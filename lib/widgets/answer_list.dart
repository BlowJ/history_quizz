import 'package:flutter/material.dart';
import 'package:history_quizz/views/answer_cards.dart';

class AnswerList extends StatelessWidget {
  AnswerList(
      {this.answerText1,
      this.answerText2,
      this.answerText3,
      this.answerText4,
      this.correctAnswer});

  @override
  AnswerCard answerText1;
  AnswerCard answerText2;
  AnswerCard answerText3;
  AnswerCard answerText4;
  String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[answerText1, answerText2, answerText3, answerText4],
    );
  }
}
