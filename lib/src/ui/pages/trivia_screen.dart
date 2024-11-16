import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_puzzle/src/domain/models/question.dart';
import 'package:my_puzzle/src/domain/models/questions_data.dart';

class TriviaScreen extends StatefulWidget {
  final Function onRestartSound;
  const TriviaScreen({Key? key, required this.onRestartSound})
      : super(key: key);

  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen>
    with SingleTickerProviderStateMixin {
  late List<Question> easyQuestions;
  late List<Question> mediumQuestions;
  late List<Question> hardQuestions;
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String feedbackMessage = "";
  Timer? timer;
  late BoxDecoration boxDecoration;
  late BoxDecoration boxDecorationAppbar;
  final AudioPlayer audioPlayer = AudioPlayer();
  final AudioPlayer audioPlayerAnswers = AudioPlayer();
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  static const int maxTime = 10;
  int remainingTime = maxTime;
  int difficultyLevel = 0; // Nivel actual de dificultad

  // Define tiempos para cada nivel de dificultad
  static const int easyTime = 15;
  static const int mediumTime = 10;
  static const int hardTime = 5;

  @override
  void initState() {
    super.initState();
    // Cargar preguntas por dificultad y mezclar aleatoriamente
    easyQuestions = getQuestions()
        .where((q) => q.difficulty == Difficulty.easy)
        .toList()
      ..shuffle();
    mediumQuestions = getQuestions()
        .where((q) => q.difficulty == Difficulty.medium)
        .toList()
      ..shuffle();
    hardQuestions = getQuestions()
        .where((q) => q.difficulty == Difficulty.hard)
        .toList()
      ..shuffle();

    loadQuestions();
    initializeAnimation();

    setBackgroundColorAndSound();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    audioPlayer.stop();
    audioPlayerAnswers.stop();
    audioPlayerAnswers.dispose();
    audioPlayer.dispose(); // Detener y liberar el reproductor de audio

    super.dispose();
  }

  void initializeAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: maxTime),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _progressAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  void loadQuestions() {
    if (difficultyLevel == 0) {
      questions = easyQuestions.take(5).toList();
    } else if (difficultyLevel == 1) {
      isAnswered = false;
      questions = mediumQuestions.take(5).toList();
    } else if (difficultyLevel == 2) {
      isAnswered = false;
      questions = hardQuestions.take(5).toList();
    }
    currentQuestionIndex = 0;
    setBackgroundColorAndSound();
  }

  void setBackgroundColorAndSound() {
    switch (difficultyLevel) {
      case 0: //Easy
        boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[300]!.withOpacity(0.9),
              Colors.teal[900]!.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
        boxDecorationAppbar = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[600]!,
              Colors.green[800]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
        audioPlayer.setSource(AssetSource(
            'sounds/easy.wav')); // Asegúrate de tener el archivo en assets
        break;
      case 1: //Medium
        boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 234, 170, 102).withOpacity(0.7),
              const Color.fromARGB(255, 255, 140, 0).withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
        boxDecorationAppbar = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow[700]!,
              Colors.yellow[900]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
        audioPlayer.setSource(AssetSource('sounds/medium.wav'));
        break;
      case 2: //Hard
        boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 241, 111, 111).withOpacity(0.7),
              const Color.fromARGB(255, 177, 14, 14).withOpacity(0.7)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
        boxDecorationAppbar = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red[600]!,
              Colors.red[800]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
        audioPlayer.setSource(AssetSource('sounds/hard.mp3'));
        break;
      default:
        boxDecoration = const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 189, 189, 189)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
        break;
    }
    audioPlayer.resume(); // Reproducir el sonido
  }

  void startTimer() {
    // Ajusta el tiempo de respuesta según el nivel de dificultad
    switch (difficultyLevel) {
      case 0:
        remainingTime = easyTime;
        _controller.duration = const Duration(seconds: easyTime);
        break;
      case 1:
        remainingTime = mediumTime;
        _controller.duration = const Duration(seconds: mediumTime);
        break;
      case 2:
        remainingTime = hardTime;
        _controller.duration = const Duration(seconds: hardTime);
        break;
      default:
        remainingTime = mediumTime; // Tiempo predeterminado
        _controller.duration = const Duration(seconds: mediumTime);
    }

    // Reinicia la animación y el temporizador
    _controller.forward(from: 0.0);
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        checkAnswer(
            -1); // Llama a la función para indicar que el tiempo se agotó
      }
    });
  }

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;

    bool isCorrect =
        selectedIndex == questions[currentQuestionIndex].correctAnswerIndex;

    setState(() {
      timer?.cancel();
      isAnswered = true;
      score += isCorrect ? 1 : 0;

      showFeedbackDialog(
        isCorrect ? questions[currentQuestionIndex].info : 'Sigue intentando',
        isCorrect
            ? questions[currentQuestionIndex].imagePath
            : 'assets/images/wrong_answer.jpeg',
        isCorrect ? 'Correcto' : 'Incorrecto',
      );

      if (isCorrect) {
        audioPlayerAnswers.play(
          AssetSource('sounds/correct_answer.wav'),
          volume: 1,
        );
      } else {
        audioPlayerAnswers.play(
          AssetSource('sounds/incorrect_answer.wav'),
          volume: 1,
        );
      }

      audioPlayerAnswers.resume(); // Reproducir el sonido
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        startTimer();
      } else {
        if (difficultyLevel < 2) {
          difficultyLevel++;
          loadQuestions();
          startTimer();
        } else {
          _showFinalScoreDialog();
        }
      }
    });
  }

  void _showFinalScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Juego Terminado",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Tu puntuación es $score/${questions.length * 3}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Reiniciar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                audioPlayer.stop();
                Navigator.of(context).pop();
                resetGame();
              },
            ),
            TextButton(
              child: const Text(
                "Salir",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                audioPlayer.stop();
                Navigator.pushReplacementNamed(context, '/menu');
              },
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      isAnswered = false;
      difficultyLevel = 0;
      loadQuestions();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vestigios Salvajes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Color del texto
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.navigate_before_sharp,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                audioPlayer.stop();
                widget.onRestartSound.call();
                Navigator.of(context).pop();
              },
            );
          },
        ),
        // backgroundColor: Colors.green[700], // Color de fondo del AppBar

        flexibleSpace: Container(
          decoration: boxDecorationAppbar,
        ),
      ),
      body: Container(
        decoration: boxDecoration, // Cambiar el color de fondo
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pregunta ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: _progressAnimation.value,
              borderRadius: BorderRadius.circular(8.0),
              color:
                  Colors.redAccent, // Cambia el color de la barra si lo deseas
              backgroundColor: Colors.grey[300],
              minHeight: 8.0,
            ),
            const SizedBox(height: 20),
            DottedBorder(
              // color: Colors.black,
              strokeWidth: 1.5,
              dashPattern: const [6, 3],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  currentQuestion.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return ElevatedButton(
                onPressed: isAnswered ? null : () => checkAnswer(idx),
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    backgroundColor: isAnswered ? Colors.grey : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                child: Text(option),
              );
            }),
            const SizedBox(height: 20),
            Text(feedbackMessage, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isAnswered ? nextQuestion : null,
              child: const Text(
                'Siguiente',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Muestra el diálogo de feedback con mensaje e imagen
  void showFeedbackDialog(
    String feedbackMessage,
    String imagePath,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  // width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                feedbackMessage,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
