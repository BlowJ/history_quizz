import 'package:flutter/material.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/screens/main_screen.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  Header({this.timeRemain, this.lifeRemain});

  String timeRemain;
  String lifeRemain;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
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
                Navigator.of(context).pushNamed(WelcomePage.id);
              },
            ),
            Text(
              widget.timeRemain,
              style: TextStyle(
                fontSize: 32.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  size: 62.0,
                ),
                Text(
                  widget.lifeRemain,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
