import 'dart:async';
import 'package:history_quizz/models/user_score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String db_name = "userScore.db";
Database _database;

Future<Database> get database async {
  if (_database != null) return _database;
  _database = await _initDatabase();
  return _database;
}

_initDatabase() async {
  print('db path: ${await getDatabasesPath()}');
  return await openDatabase(join(await getDatabasesPath(), db_name),
      onCreate: (db, version) async {
    await db.execute('''
        CREATE TABLE score_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        score TEXT
        )
    ''');
  }, version: 1);
}

Future<void> newScore(Score newScore) async {
  final db = await database;

  await db.insert(
    'score_table',
    newScore.toMap(),
  );
}

Future<List<Score>> getScore() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('score_table');
  return List.generate(maps.length, (i) {
    return Score(score: maps[i]['score'], id: maps[i]['id']);
  });
}

Future<void> deleteScore() async {
  // Get a reference to the database.
  final db = await database;
  await db.delete('score_table');
}
