import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class QuizzData extends ChangeNotifier {
  static final qData = FirebaseFirestore.instance;
  static int index = 0;
  int score = 1;
  int sec = 20;
  int min = 1;

  Future getCorrectAnswer() {
    return qData.collection('quizz_bank').doc('c${index + 1}').get().then(
        (DocumentSnapshot documentSnapshot) =>
            documentSnapshot.data()['correct_answer']);
  }

  Future<int> countDocuments() async {
    QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection('quizz_bank').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    print(_myDocCount.length);
    return _myDocCount.length; // Count of Documents in Collection
  }

  checkAnswer(String a) async {
    if (a == await getCorrectAnswer()) {
      print(a);
      print('Right');
      isFinished();
      isPass();
      notifyListeners();
      return true;
    } else {
      print(a);
      print(await getCorrectAnswer());
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

  isFinished() async {
    if (index >= await countDocuments() - 1) {
      return true;
    } else {
      print(index);
      index += 1;
      return false;
    }
  }

  isPass() async {
    if (score == await countDocuments() + 1) {
      score = await countDocuments() + 1;
    } else
      ++score;
    // print(score);
  }


}
