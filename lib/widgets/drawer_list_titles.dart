import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/screens/tien_su_screen.dart';
import 'package:provider/provider.dart';

class DrawerListTitle extends StatelessWidget {
  DrawerListTitle(
      {@required this.pColor, this.leadIcon, this.titleText, this.onClick});

  final Color pColor;
  IconData leadIcon;
  String titleText;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: Icon(
        leadIcon,
        color: pColor,
      ),
      title: Text(
        titleText,
        style: TextStyle(color: pColor, fontSize: 17.0),
      ),
    );
  }
}
