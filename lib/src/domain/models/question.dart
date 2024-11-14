enum Difficulty { easy, medium, hard }

class Question {
  String question;
  List<String> options;
  int correctAnswerIndex;
  String info;
  Difficulty difficulty;
  String imagePath;
  String nombreCientifico;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.info,
    required this.difficulty,
    required this.imagePath,
    required this.nombreCientifico,
  });
}
