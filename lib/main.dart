// lib/main.dart
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vestigios_salvajes/models/question.dart';
import 'package:vestigios_salvajes/src/pages/trivia_screen.dart';
import 'package:vestigios_salvajes/src/widgets/jungle_clipper.dart';

void main() {
  runApp(const TriviaApp());
}

class TriviaApp extends StatelessWidget {
  const TriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vestigios Salvajes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DifficultySelectionScreen(),
    );
  }
}

class DifficultySelectionScreen extends StatefulWidget {
  const DifficultySelectionScreen({super.key});

  @override
  _DifficultySelectionScreenState createState() =>
      _DifficultySelectionScreenState();
}

class _DifficultySelectionScreenState extends State<DifficultySelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // Inicializar el AudioPlayer y reproducir el sonido de jungla
    _audioPlayer = AudioPlayer();
    _audioPlayer.play(
      AssetSource('/sounds/jungle_sound.mp3'),
      volume: 1,
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);

    // Iniciar la animación al cargar la pantalla
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // Detener y liberar el reproductor de audio

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[300]!, Colors.teal[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Vestigios Salvajes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montez',
                      fontFamilyFallback: <String>[
                        'Montez-Regular',
                      ],
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipPath(
                    clipper: JungleClipper(),
                    child: Image.asset(
                      'assets/images/intro_image.webp', // Asegúrate de tener esta imagen en tu proyecto
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Selecciona el nivel de dificultad',
                    style: TextStyle(fontSize: 22, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TriviaScreen(difficulty: Difficulty.easy),
                        ),
                      );
                    },
                    child: const Text('Fácil'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TriviaScreen(difficulty: Difficulty.medium),
                        ),
                      );
                    },
                    child: const Text('Intermedio'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TriviaScreen(difficulty: Difficulty.hard),
                        ),
                      );
                    },
                    child: const Text('Difícil'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
