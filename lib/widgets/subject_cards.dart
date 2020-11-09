import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({this.cardImage, this.cardText});

  Image cardImage;
  String cardText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Center(
          child: Opacity(
            opacity: 0.8,
            child: Container(
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
          ),
        ),
        Positioned(
          bottom: 15.0,
          child: Text(
            cardText,
            style: TextStyle(
              fontSize: 32.0,
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
        )
      ],
    );
  }
}
