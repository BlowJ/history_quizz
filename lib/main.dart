import 'package:flutter/material.dart';
import 'package:history_quizz/screens/bac_thuoc_screen.dart';
import 'package:history_quizz/screens/doi_moi_screen.dart';
import 'package:history_quizz/screens/hong_bang_screen.dart';
import 'package:history_quizz/screens/phap_thuoc_screen.dart';
import 'package:history_quizz/screens/phong_kiren_screen.dart';
import 'package:history_quizz/screens/tien_su_screen.dart';
import 'package:history_quizz/screens/welcome_screen.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/models/quizz_brain.dart';

void main() {
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
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: WelcomePage(),
        initialRoute: WelcomePage.id,
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          BacThuoc.id: (context) => BacThuoc(),
          DoiMoi.id: (context) => DoiMoi(),
          HongBang.id: (context) => HongBang(),
          PhapThuoc.id: (context) => PhapThuoc(),
          PhongKien.id: (context) => PhongKien(),
          TienSu.id: (context) => TienSu(),
        },
      ),
    );
  }
}
