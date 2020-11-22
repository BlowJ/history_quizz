import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerListTitle extends StatelessWidget {
  DrawerListTitle({@required this.pColor, this.leadIcon, this.titleText});

  final Color pColor;
  IconData leadIcon;
  String titleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
