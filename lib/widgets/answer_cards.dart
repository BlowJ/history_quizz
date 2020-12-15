import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/screens/main_screen.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/utils/score_data.dart';
import 'package:history_quizz/widgets/answer_list.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:provider/provider.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';

class AnswerCard extends StatefulWidget {
  AnswerCard({this.answer});

  String answer;
  bool isSelected = false;

  @override
  _AnswerCardState createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  Emoji smile = Emoji.byName('Slightly Smiling Face');

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return GestureDetector(
          onTap: () async {
            setState(() {
              widget.isSelected = !widget.isSelected;
            });

            if ((QuizzData.index < await quizzdata.countDocuments() - 1) &&
                (widget.answer == await QuizzData().getCorrectAnswer())) {
              showDialog(
                  context: context,
                  builder: (_) => EndDialog(
                        title: 'Yay',
                        content: 'Tiếp tục chứ ${smile}',
                        onTap: () {
                          newScore(
                            Score(
                                score:
                                    '${Provider.of<QuizzData>(context, listen: false).score}'),
                          );
                          setState(() {
                            widget.isSelected = !widget.isSelected;
                          });
                          Navigator.pop(context);
                        },
                      ));
            }
            quizzdata.checkAnswer(widget.answer);
            if ((widget.answer != await QuizzData().getCorrectAnswer())) {
              if (quizzdata.score == 0) {
                showDialog(
                    context: context,
                    builder: (_) => EndDialog(
                          title: 'Toẹt vời',
                          content: 'Bạn đã hết điểm ${smile}',
                          onTap: () {
                            print(getScore());
                            Navigator.of(context).pushNamed(WelcomePage.id);
                          },
                        ));
              } else {
                showDialog(
                    context: context,
                    builder: (_) =>
                        EndDialog(
                          title: 'Cảnh báo',
                          content:
                          'Bạn còn ${quizzdata.score} lần chọn ${smile}',
                          onTap: () {
                            newScore(
                              Score(
                                  score:
                                  '${Provider
                                      .of<QuizzData>(context, listen: false)
                                      .score}'),
                            );
                            Navigator.pop(context);
                          },
                        ));
              }
            }

            if ((QuizzData.index >= await quizzdata.countDocuments() - 1) &&
                (widget.answer == await QuizzData().getCorrectAnswer())) {
              showDialog(
                  context: context,
                  builder: (_) =>
                      EndDialog(
                        title: 'Toẹt vời',
                        content: 'Bạn đã hoàn thành thử thách ${smile}',
                        onTap: () {
                          newScore(
                            Score(
                                score:
                                '${Provider
                                    .of<QuizzData>(context, listen: false)
                                    .score}'),
                          );
                          print(getScore());
                          Navigator.of(context).pushNamed(WelcomePage.id);
                        },
                      ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 27.0),
            width: double.infinity,
            height: 55.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28.0),
              color: widget.isSelected ? Color(0xFFFFFFFF) : Color(0xFF11182B),
              border: Border.all(
                color: Color(0xFFFFFFFF),
                width: 4.0,
              ),
            ),
            child: Text(
              widget.answer,
              style: TextStyle(
                fontSize: 20.0,
                color:
                widget.isSelected ? Theme
                    .of(context)
                    .primaryColor : Color(0xFFFFFFFF),
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
}
