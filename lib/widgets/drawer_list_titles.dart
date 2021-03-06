import 'package:flutter/material.dart';
import 'package:history_quizz/models/providers/quizz_brain.dart';
import 'package:provider/provider.dart';

class DrawerListTitle extends StatelessWidget {
  DrawerListTitle(
      {@required this.pColor,
      this.leadIcon,
      this.titleText,
      this.onClick,
      this.backgroundColor});

  final Color pColor;
  IconData leadIcon;
  String titleText;
  Function onClick;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzData>(
      builder: (context, quizzdata, child) {
        return GestureDetector(
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: ListTile(
              leading: Icon(
                leadIcon,
                color: pColor,
              ),
              title: Text(
                titleText,
                style: TextStyle(color: pColor, fontSize: 17.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
