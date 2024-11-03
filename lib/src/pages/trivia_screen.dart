import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Importa el paquete de audio
import 'package:vestigios_salvajes/models/question.dart';
import 'package:vestigios_salvajes/models/questions_data.dart';

class TriviaScreen extends StatefulWidget {
  final Difficulty difficulty;

  const TriviaScreen({super.key, required this.difficulty});

  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen>
    with SingleTickerProviderStateMixin {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String feedbackMessage = "";
  Timer? timer;
  late BoxDecoration boxDecoration;
  late BoxDecoration boxDecorationAppbar;
  late AudioPlayer audioPlayer;

  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  static const int maxTime = 10; // Tiempo total
  int remainingTime = maxTime; // Tiempo restante

  @override
  void initState() {
    super.initState();
    questions =
        getQuestions().where((q) => q.difficulty == widget.difficulty).toList();
    audioPlayer = AudioPlayer();

    // Inicializar el controlador de animación
    _controller = AnimationController(
      duration: const Duration(seconds: maxTime),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _progressAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    setBackgroundColorAndSound();
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.stop();

    audioPlayer.dispose(); // Detener y liberar el reproductor de audio

    super.dispose();
  }

  void setBackgroundColorAndSound() {
    switch (widget.difficulty) {
      case Difficulty.easy:
        boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[300]!.withOpacity(0.7),
              Colors.teal[900]!.withOpacity(0.7),
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        );
        audioPlayer.setSource(AssetSource(
            'sounds/easy.wav')); // Asegúrate de tener el archivo en assets
        break;
      case Difficulty.medium:
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        );
        audioPlayer.setSource(AssetSource('sounds/medium.wav'));
        break;
      case Difficulty.hard:
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
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
    remainingTime = maxTime;
    _controller.forward(); // Comienza la animación
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
      } else {
        timer.cancel();
        checkAnswer(-1); // Considera incorrecto si el tiempo se agota
      }
    });
  }

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;
    String feedbackMessage;
    String imagePath;
    bool isCorrect = false;

    setState(() {
      timer?.cancel();
      isAnswered = true;
      if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }

      if (isCorrect) {
        feedbackMessage =
            '¡Correcto! Este animal es el dodo, extinto hace siglos.';
        imagePath = 'assets/images/animals/megatherium.jpg';
      } else {
        feedbackMessage = 'Incorrecto. Intenta nuevamente.';
        imagePath = 'assets/images/wrong_answer.jpeg';
      }

      showFeedbackDialog(
        feedbackMessage,
        imagePath,
        isCorrect ? 'Correcto' : 'Incorrecto',
      );

      // audioPlayer
      //     .setSource(AssetSource('sounds/answer.mp3')); // Sonido al responder
      audioPlayer.resume(); // Reproducir el sonido
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
                resetGame();
              },
            ),
            TextButton(
              child: const Text("Salir"),
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí podrías navegar a otra pantalla o cerrar la app
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
      feedbackMessage = "";
      startTimer();
      setBackgroundColorAndSound(); // Reestablecer el color y el sonido
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
                Navigator.of(context).pop();
              },
            );
          },
        ),
        // backgroundColor: Colors.green[700], // Color de fondo del AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Información',
            onPressed: () {
              // Lógica para mostrar información o ayuda
            },
            color: Colors.white, // Color del ícono
          ),
        ],
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
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
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
