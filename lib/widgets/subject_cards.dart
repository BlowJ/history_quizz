import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({@required this.subjectImage, this.cardChild});

  final Color subjectImage;
  final Widget cardChild;

  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
