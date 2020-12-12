import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/screens/facebook_screen.dart';
import 'package:history_quizz/screens/google_screen.dart';
import 'package:history_quizz/screens/main_screen.dart';
import 'package:history_quizz/screens/reset_screen.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/models/quizz_brain.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizzData(),
        )
      ],
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: WelcomePage(),
        initialRoute: WelcomePage.id,
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          StartGame.id: (context) => StartGame(),
          GoogleUser.id: (context) => GoogleUser(),
          FacebookUser.id: (context) => FacebookUser(),
          Reset.id: (context) => Reset()
        },
      ),
    );
  }
}
