import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:history_quizz/screens/main_screen.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/widgets/answer_cards.dart';
import 'package:provider/provider.dart';

class EndDialog extends StatefulWidget {
  EndDialog({this.title, this.content, this.onTap});

  String title;
  String content;
  Function onTap;

  @override
  _EndDialogState createState() => _EndDialogState();
}

class _EndDialogState extends State<EndDialog> {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      elevation: 1.0,
      backgroundColor: Color(0xFFCED7EC),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: new Text(
        widget.title,
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
        widget.content,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: widget.onTap,
          child: Text(
            'OK',
            style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w700,
                color: Theme
                    .of(context)
                    .primaryColor),
          ),

        )
      ],
    );
  }
}
