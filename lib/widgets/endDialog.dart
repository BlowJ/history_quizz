import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';
import 'package:history_quizz/screens/welcome_screen.dart';

class EndDialog extends StatelessWidget {
  const EndDialog({
    Key key,
    @required this.smile,
  }) : super(key: key);

  final Emoji smile;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      elevation: 1.0,
      backgroundColor: Color(0xFFCED7EC),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: new Text(
        "Khá lắm con đĩ $smile",
        style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
          shadows: [
            Shadow(
              blurRadius: 1.0,
              color: Colors.black,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      content: new Text(
        "Cút mẹ mày đi chỗ khác chơi",
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(WelcomePage.id);
          },
        )
      ],
    );
  }
}
