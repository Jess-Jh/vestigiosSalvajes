import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_state.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/puzzle_tile.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';
import 'package:provider/provider.dart';

/// render the puzzle
class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: darkColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controller = context.watch<GameController>();
          final state = controller.state;
          final tileSize = constraints.maxWidth / state.crossAxisCount;

          final puzzle = state.puzzle;

          /// the puzzle is locked is the game status is not playing
          return AbsorbPointer(
            absorbing: state.status != GameStatus.playing,
            child: Stack(
              children: puzzle.tiles
                  .map(
                    (e) => PuzzleTile(
                      tile: e,
                      size: tileSize,
                      gameStatus: state.status,
                      showNumbersInTileImage: state.crossAxisCount > 4,
                      onTap: () => controller.onTileTapped(e),
                      imageTile: puzzle.segmentedImage != null
                          ? puzzle.segmentedImage![e.value - 1]
                          : null,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
