import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/widgets/answer_cards.dart';
import 'package:history_quizz/widgets/endDialog.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/widgets/answer_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class QuizzData extends ChangeNotifier {
  static final qData = FirebaseFirestore.instance;
  static int index = 0;
  int score = 1;
  int timer = 200;

  Future getCorrectAnswer(String c) {
    return qData.collection(c).doc('c${index + 1}').get().then(
        (DocumentSnapshot documentSnapshot) =>
            documentSnapshot.data()['correct_answer']);
  }

  Future<int> countDocuments(String c) async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection(c).get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    print(_myDocCount.length);
    return _myDocCount.length; // Count of Documents in Collection
  }

  checkAnswer(String a, String s) async {
    if (a == await getCorrectAnswer(s)) {
      print(a);
      print('Right');

      isFinished(s);
      isPass(s);
      notifyListeners();
      return true;
    } else {
      print(a);
      print(await getCorrectAnswer(s));
      score--;
      print('Wrong');
      if (score <= 0) {
        score = 0;
      }
      notifyListeners();
      return false;
    }
  }

  resetQuizz() {
    index = 0;
    score = 1;
    notifyListeners();
  }

  isFinished(String c) async {
    if (index >= await countDocuments(c) - 1) {
      return true;
    } else {
      print(index);
      index++;
      return false;
    }
  }

  isPass(String c) async {
    if (score == await countDocuments(c) + 1) {
      score = await countDocuments(c) + 1;
    } else
      score++;
  }
}
