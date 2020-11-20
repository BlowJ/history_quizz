import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({this.questionNumber, this.questionText});

  String questionNumber;
  String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(30.0),
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
        color: Color(0xFFC8CEDF),
        border: Border.all(
          color: Color(0xFF0E1321),
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            questionNumber,
            style: TextStyle(
              fontSize: 25.0,
              color: Color(0xFF0A0E21),
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            questionText,
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFF0A0E21),
              fontWeight: FontWeight.w500,
            ),
          ),
          // Padding(padding: EdgeInsets.only(bottom: 15.0)),
        ],
      ),
    );
  }
}
