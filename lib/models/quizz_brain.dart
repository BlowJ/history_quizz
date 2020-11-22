import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:history_quizz/widgets/question_cards.dart';
import 'package:history_quizz/widgets/answer_cards.dart';

class QuizzData extends ChangeNotifier {
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

  List<AnswerCard> _a = [
    AnswerCard(
      answerText: 'Lạng Sơn',
    ),
    AnswerCard(answerText: 'Hà Nội'),
    AnswerCard(answerText: 'Lào Cai'),
    AnswerCard(answerText: 'Phú Yên'),
  ];

  get question {
    return _q;
  }

  get answer {
    return _a;
  }

  // set newQuestion (String newN, String newT){
  //    question.questionNumber = newN;
  //    question.questionText = newT;
  // }
  void checkAnswer(String a) {
    if (a == 'Lạng Sơn') {
      question[0].questionNumber = 'Câu 2';
      question[0].questionText =
          'Con người đã sử dụng nhiều loại công cụ bằng đá có chức năng riêng; biết làm đồ gốm, trồng trọt sơ khai, từ giã hái lượm để sản xuất vào thởi điểm nào ?';
      answer[0].answerText = 'Khoảng 6000 - 10000 năm trước';
      answer[1].answerText = 'Khoảng 4000 - 10000 năm trước';
      answer[2].answerText = 'Khoảng 2000 - 5000 năm trước';
      answer[3].answerText = 'Khoảng 2000 - 6000 năm trước';
      // print('ok');
      notifyListeners();
    } else {
      print('err');
    }
  }
}
