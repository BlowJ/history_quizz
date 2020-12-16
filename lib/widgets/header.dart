import 'package:flutter/material.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:history_quizz/models/user_score.dart';
import 'package:history_quizz/models/utils/score_data.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  Header({this.time});

  String time;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    newScore(
      Score(score: '${Provider.of<QuizzData>(context, listen: false).score}'),
    );
    print('${Provider.of<QuizzData>(context, listen: false).score}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getScore(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Consumer<QuizzData>(
                builder: (context, quizzdata, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 38.0,
                        ),
                        onTap: () {
                          quizzdata.score -= 3;
                          newScore(
                            Score(
                                score:
                                '${Provider
                                    .of<QuizzData>(context, listen: false)
                                    .score}'),
                          );
                          print(getScore());
                          Navigator.of(context).popAndPushNamed(WelcomePage.id);
                        },
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('${snapshot.data.last.score}');
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border,
                              size: 62.0,
                            ),
                            Text(
                              quizzdata.score.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
            );
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
