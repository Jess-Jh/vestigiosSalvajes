import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vestigios_salvajes/models/question.dart';
import 'package:vestigios_salvajes/models/questions_data.dart';

class TriviaScreen extends StatefulWidget {
  final Difficulty difficulty;

  const TriviaScreen({super.key, required this.difficulty});

  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String feedbackMessage = "";
  int remainingTime = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    questions =
        getQuestions().where((q) => q.difficulty == widget.difficulty).toList();
    startTimer();
  }

  void startTimer() {
    remainingTime = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          checkAnswer(-1); // Considera incorrecto si el tiempo se agota
        }
      });
    });
  }

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;
    timer?.cancel();
    setState(() {
      isAnswered = true;
      if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
        feedbackMessage = "¡Correcto! ${questions[currentQuestionIndex].info}";
      } else {
        feedbackMessage = "Incorrecto. ${questions[currentQuestionIndex].info}";
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        feedbackMessage = "";
        startTimer();
      } else {
        _showFinalScoreDialog();
      }
    });
  }

  void _showFinalScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Juego Terminado"),
          content: Text("Tu puntuación es $score/${questions.length}"),
          actions: <Widget>[
            TextButton(
              child: const Text("Reiniciar"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  isAnswered = false;
                  feedbackMessage = "";
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia de Animales Extintos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tiempo restante: $remainingTime s',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text(
              'Pregunta ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return ElevatedButton(
                onPressed: () => checkAnswer(idx),
                child: Text(option),
              );
            }),
            const SizedBox(height: 20),
            Text(feedbackMessage, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            if (isAnswered)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text('Siguiente'),
              ),
          ],
        ),
      ),
    );
  }
}
