import 'package:flutter/material.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:provider/provider.dart';

class AnswerCard extends StatelessWidget {
  AnswerCard({this.answerText, this.checkAnswer});

  @override
  String answerText;
  Function checkAnswer;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 27.0),
            width: double.infinity,
            height: 55.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28.0),
              color: Color(0xFF11182B),
              border: Border.all(
                color: Color(0xFFFFFFFF),
                width: 4.0,
              ),
            ),
            child: Text(
              answerText,
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            quizzdata.checkAnswer(answerText);
          },
        );
      },
    );
  }
}
