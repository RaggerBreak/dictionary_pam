class Word {
  final int id;
  final String wordEng;
  final String wordPl;
  final String description;

  Word({this.id, this.wordEng, this.wordPl, this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wordEng': wordEng,
      'wordPl': wordPl,
      'description': description,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
    'wordEng': wordEng,
    'wordPl': wordPl,
    'description': description,
    };
  }

  static Word fromMap(Map<String, dynamic> map) {
    return new Word(
        id: map['id'], wordEng: map['wordEng'], wordPl: map['wordPl'], description: map['definition']);
  }
}