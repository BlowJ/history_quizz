import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  static String id = 'reset_screen';
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Text('Bạn đã hết điểm')
              ],
            ),
          )
        ),
      ),
    );
  }
}
