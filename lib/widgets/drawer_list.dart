import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_drawer/curved_drawer.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF112A43),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text("Header"),
            ),
            ListTile(
              title: Text('Item 1'),
            )
          ],
        ),
      ),
    );
  }
}
