import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/widgets/answer_cards.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/widgets/answer_list.dart';

class QuizzData extends ChangeNotifier {
  static int index = 0;
  int score = 0;
  int timer = 150;

  List<QuestionCard> _q = [
    QuestionCard(
      questionNumber: 'Câu 1',
      questionText:
          'Cho đến nay, các nhà khảo cổ học đã tìm thấy dấu vết của người vượn Homo erectus trong một số hang động ở đâu ?',
    ),
    QuestionCard(
      questionNumber: 'Câu 2',
      questionText:
          'Con người đã sử dụng nhiều loại công cụ bằng đá có chức năng riêng; biết làm đồ gốm, trồng trọt sơ khai, từ giã hái lượm để sản xuất vào thời điểm nào ?',
    ),
  ];

  List<AnswerList> _a = [
    AnswerList(
      answerText1: AnswerCard(answer: 'Lạng Sơn'),
      answerText2: AnswerCard(answer: 'Hà Nội'),
      answerText3: AnswerCard(answer: 'Lào Cai'),
      answerText4: AnswerCard(answer: 'Phú Yên'),
      correctAnswer: 'Lạng Sơn',
    ),
    AnswerList(
      answerText1: AnswerCard(answer: 'Khoảng 6000 - 10000 năm trước'),
      answerText2: AnswerCard(answer: 'Khoảng 4000 - 10000 năm trước'),
      answerText3: AnswerCard(answer: 'Khoảng 2000 - 5000 năm trước'),
      answerText4: AnswerCard(answer: 'Khoảng 2000 - 6000 năm trước'),
      correctAnswer: 'Khoảng 2000 - 6000 năm trước',
    ),
  ];

  get question {
    return _q;
  }

  get answer {
    return _a;
  }

  bool checkAnswer(String a) {
    if (a == answer[index].correctAnswer) {
      print('Right');
      isPass();
      isFinished();
      notifyListeners();
      return true;
    } else {
      score--;
      print('Wrong');
      if (score <= 0) {
        score = 0;
      }
      notifyListeners();
      return false;
    }
  }

  bool resetQuizz() {
    index = 0;
    score = 0;
    return true;
  }

  bool isFinished() {
    if (index >= _q.length - 1) {
      return true;
    } else {
      index++;
      return false;
    }
  }

  isPass() {
    if (score == _q.length) {
      score = _q.length;
    } else
      score++;
  }
}
