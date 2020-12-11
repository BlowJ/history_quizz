class Score {
  String score;
  int id;

  Score({this.score, this.id});

  Map<String, dynamic> toMap() {
    return {'score': score, 'id': id};
  }
}
