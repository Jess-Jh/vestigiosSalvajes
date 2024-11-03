import 'package:vestigios_salvajes/models/question.dart';

List<Question> getQuestions() {
  return [
    Question(
      question:
          "¿Qué especie extinta de Colombia era conocida por su gran tamaño?",
      options: ["Megatherium", "Dodo", "Moa", "Tigre de Tasmania"],
      correctAnswerIndex: 0,
      info: "El Megatherium fue un perezoso gigante que vivió en Sudamérica.",
      difficulty: Difficulty.easy,
    ),
    Question(
      question:
          "¿Cuál fue la principal causa de extinción del Pájaro Carpintero Real?",
      options: [
        "Deforestación",
        "Caza",
        "Cambio climático",
        "Competencia con otras especies"
      ],
      correctAnswerIndex: 0,
      info:
          "La deforestación fue la principal causa de la extinción del Pájaro Carpintero Real.",
      difficulty: Difficulty.medium,
    ),
    Question(
      question:
          "¿Qué especie extinta de Colombia era conocida por su gran tamaño?",
      options: ["Megatherium", "Dodo", "Moa", "Tigre de Tasmania"],
      correctAnswerIndex: 0,
      info: "El Megatherium fue un perezoso gigante que vivió en Sudamérica.",
      difficulty: Difficulty.hard,
    ),
    // Añade más preguntas con diferentes dificultades...
  ];
}
