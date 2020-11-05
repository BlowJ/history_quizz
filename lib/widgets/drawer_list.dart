import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text("Header"),
        ),
        ListTile(
          title: Text("Home"),
        )
      ],
    );
  }
}
