import 'package:flutter/material.dart';

class GoogleUser extends StatefulWidget {
  static const String id = 'google_screen';

  @override
  _GoogleUserState createState() => _GoogleUserState();
}

class _GoogleUserState extends State<GoogleUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
