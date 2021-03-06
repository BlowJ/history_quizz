import 'package:flutter/material.dart';
import 'package:history_quizz/pages/facebook_screen.dart';
import 'package:history_quizz/pages/google_screen.dart';
import 'package:history_quizz/pages/main_screen.dart';
import 'package:history_quizz/pages/reset_screen.dart';
import 'package:history_quizz/pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/providers/quizz_brain.dart';

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
