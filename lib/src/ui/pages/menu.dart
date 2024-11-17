// lib/main.dart
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/game_view.dart';
import 'package:my_puzzle/src/ui/pages/trivia_screen.dart';
import 'package:my_puzzle/src/ui/pages/widgets/moving_curve_image.dart';

void main() {
  runApp(const TriviaApp());
}

class TriviaApp extends StatelessWidget {
  const TriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vestigios Salvajes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DifficultySelectionScreen(),
      // Configura la pantalla inicial de la aplicación
      // Define las rutas de la aplicación
      routes: {
        '/menu': (context) => const DifficultySelectionScreen(),
      },
    );
  }
}

class DifficultySelectionScreen extends StatefulWidget {
  const DifficultySelectionScreen({Key? key}) : super(key: key);

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

    setState(() {
      _audioPlayer.stop();
      _audioPlayer.dispose(); // Detener y liberar el reproductor de audio
    });

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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/jungle_background.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
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
                          fontSize: 68,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 58, 39),
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Imagen con bordes animados
                      const MovingCurvedImage(),

                      const SizedBox(height: 50),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _audioPlayer.stop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TriviaScreen(
                                onRestartSound: () {
                                  _audioPlayer.play(
                                    AssetSource('/sounds/jungle_sound.mp3'),
                                    volume: 1,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text('Explora la historia'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _audioPlayer.stop();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                _audioPlayer.stop();

                                return GameView(
                                  onRestartSound: () {
                                    _audioPlayer.play(
                                      AssetSource('/sounds/jungle_sound.mp3'),
                                      volume: 1,
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Reconstruye el hábitat'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
