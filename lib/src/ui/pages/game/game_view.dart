import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_puzzle/src/domain/models/move_to.dart';
import 'package:my_puzzle/src/domain/models/puzzle_image.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/background.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/game_buttons.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/puzzle_options.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/time_and_moves.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/winner_dialog.dart';
import 'package:my_puzzle/src/ui/utils/responsive.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  final Function? onRestartSound;
  const GameView({Key? key, this.onRestartSound}) : super(key: key);

  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<GameController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final width = responsive.width;
    PuzzleImage? animalSelected;

    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController();
        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                showWinnerDialog(
                  context,
                  moves: controller.state.moves,
                  time: controller.time.value,
                  animalSelected: animalSelected ??
                      const PuzzleImage(
                        name: 'Numeric',
                        info:
                            '¡Ahora ya sabes como funciona, aumenta el reto y continúa con los animales!',
                        scientificName: 'Any',
                        assetPath: 'assets/images/numeric-puzzle.png',
                      ),
                );
              },
            );
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        onKey: (event) => _onKeyBoardEvent(context, event),
        child: child!,
      ),
      child: GameBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(218, 32, 101, 34),
            title: const Text(
              'Puzzle',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 252, 252), // Color del texto
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
                    // audioPlayer.stop();
                    onRestartSound?.call();
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          body: SafeArea(
            child: OrientationBuilder(
              builder: (_, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const GameAppBar(),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          final height = constraints.maxHeight;
                          final puzzleHeight =
                              (isPortrait ? height * 0.45 : height * 0.5)
                                  .clamp(250, 700)
                                  .toDouble();
                          final optionsHeight =
                              (isPortrait ? height * 0.3 : height * 0.35)
                                  .clamp(120, 200)
                                  .toDouble();

                          return SizedBox(
                            height: height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: optionsHeight,
                                    child: PuzzleOptions(
                                      width: width,
                                      animalSelected: (option) {
                                        animalSelected = option;
                                        print(animalSelected);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  const TimeAndMoves(),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: puzzleHeight,
                                      child: const AspectRatio(
                                        aspectRatio: 1,
                                        child: PuzzleInteractor(),
                                      ),
                                    ),
                                  ),
                                  const GameButtons(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
