import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/widgets/answer_list.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:history_quizz/widgets/subject_cards.dart';
import 'package:provider/provider.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';

class AnswerCard extends StatelessWidget {
  AnswerCard({Key key, @required this.answer}) : super(key: key);

  String answer;
  Emoji smile = Emoji.byName('Slightly Smiling Face');

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return GestureDetector(
          onTap: () {
            quizzdata.checkAnswer(answer);

            if ((QuizzData.index >= quizzdata.answer.length - 1) &&
                (answer == QuizzData().answer[QuizzData.index].correctAnswer)) {
              showDialog(
                  context: context, builder: (_) => EndDialog(smile: smile));
            }
            ;
          },
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
              answer,
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
        );
      },
    );
  }

  a() {}
}
