import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({this.cardImage});

  Image cardImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 320.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(23.0),
            color: Color(0xFF393737),
            border: Border.all(
              color: Color(0xFFFFFFFF),
              width: 3.0,
            ),
            image: DecorationImage(
              image: cardImage.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
