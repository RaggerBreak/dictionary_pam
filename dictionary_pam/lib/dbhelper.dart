import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'word.dart';

class DbHelper {
  static DbHelper dbHelper;
  static Database db;

  DbHelper._createInstance();

  factory DbHelper() {
    if (dbHelper == null) {
      return DbHelper._createInstance();
    }

    return dbHelper;
  }

  Future<void> open() async {
    if (db != null) return;

    var dbPath = join(await getDatabasesPath(), 'dictionary_pam.db');

    db = await openDatabase(dbPath, onCreate: initialize, version: 1);
  }

  void initialize(Database db, int newVersion) async {
    await db.execute("""
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        wordEng TEXT,
        wordPl TEXT,
        description TEXT
      )
    """);
  }

  Future<int> insertWord(Word word) async {
    var result = await db.insert('words', word.toMapWithoutId(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<Word>> getWords() async {
    var result = await db.query("words", orderBy: "wordEng ASC");

    return List.generate(result.length, (i) => Word.fromMap(result[i]));
  }

  Future<int> deleteWord(Word word) async {
    var result = await db.delete("words", where: 'id = ?', whereArgs: [word.id]);
    return result;
  }
}
