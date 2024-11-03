import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;
  final int difficulty;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.difficulty,
  });
}

class TriviaLogic {
  final List<Question> _questionsTrivia = [
    Question(
      text: '¿Cuál es el nombre de esta especie extinta en Colombia?',
      options: ['Oso Andino', 'Delfín del río', 'Tigrillo', 'Mono Araña'],
      correctAnswer: 2,
      difficulty: 1,
    ),
    // Otras preguntas...
  ];

  int timeRemaining = 10;
  bool wasCorrect = false;
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Obtener una pregunta según el índice
  Question getQuestion(int index) => _questionsTrivia[index];

  // Número total de preguntas
  int get totalQuestions => _questionsTrivia.length;

  // Iniciar el temporizador según la dificultad
  void startTimer(int difficulty, Function onTimeout) {
    int duration;
    switch (difficulty) {
      case 1:
        duration = 15; // Fácil: 15 segundos
        break;
      case 2:
        duration = 10; // Medio: 10 segundos
        break;
      case 3:
        duration = 5; // Difícil: 5 segundos
        break;
      default:
        duration = 10;
    }

    timeRemaining = duration;

    _timer?.cancel(); // Cancelar temporizador anterior si existe
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining > 0) {
        timeRemaining--;
      } else {
        _timer?.cancel();
        onTimeout(); // Ejecutar la función de timeout
      }
    });
  }

  // Verificar la respuesta
  void checkAnswer(int selectedIndex, int questionIndex) {
    bool correct =
        _questionsTrivia[questionIndex].correctAnswer == selectedIndex;
    wasCorrect = correct;

    // Reproducir sonido
    _playSound(correct, _questionsTrivia[questionIndex].difficulty);
  }

  // Moverse a la siguiente pregunta
  void moveToNextQuestion(Function onNext) {
    Future.delayed(const Duration(seconds: 1), () => onNext());
  }

  // Reproducir sonido según la respuesta
  void _playSound(bool isCorrect, int difficulty) {
    String soundPath =
        isCorrect ? 'assets/sounds/correct.mp3' : 'assets/sounds/wrong.mp3';
    // _audioPlayer.play(soundPath);
  }

  // Indicador de tiempo restante
  Widget timeIndicator(int timeRemaining) {
    double progress = timeRemaining / 15; // Máximo de 15 segundos

    Color progressColor;
    if (progress > 0.5) {
      progressColor = Colors.green;
    } else if (progress > 0.2) {
      progressColor = Colors.yellow;
    } else {
      progressColor = Colors.red;
    }

    return LinearProgressIndicator(
      value: progress,
      valueColor: AlwaysStoppedAnimation(progressColor),
      backgroundColor: Colors.grey[300],
    );
  }

  // Obtener color según la dificultad
  Color getColorByDifficulty(int difficulty) {
    switch (difficulty) {
      case 1:
        return Colors.lightGreen;
      case 2:
        return Colors.orangeAccent;
      case 3:
        return Colors.redAccent;
      default:
        return Colors.white;
    }
  }
}
