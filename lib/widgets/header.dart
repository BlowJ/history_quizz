import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({this.timeRemain, this.lifeRemain});

  String timeRemain;
  String lifeRemain;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            size: 38.0,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Text(
          timeRemain,
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
              lifeRemain,
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
  }
}
