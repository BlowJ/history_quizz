import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({this.cardImage, this.cardText, this.onPressed});

  Image cardImage;
  String cardText;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
            child: Opacity(
              opacity: 0.8,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.color),
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(23.0),
                    color: Color(0xFF393737),
                    // border: Border.all(
                    //   color: Color(0xFFFFFFFF),
                    //   width: 3.0,
                    // ),
                    // image: DecorationImage(
                    //   image: cardImage.image,
                    //   fit: BoxFit.fill,
                    // ),
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
      ),
    );
  }
}
