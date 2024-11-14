import 'package:flutter/material.dart';
import 'package:my_puzzle/generated/l10n.dart';
import 'package:my_puzzle/src/domain/models/puzzle_image.dart';
import 'package:my_puzzle/src/ui/icons/puzzle_icons.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';
import 'package:my_puzzle/src/ui/utils/time_parser.dart';

Future<void> showWinnerDialog(
  BuildContext context, {
  required int moves,
  required int time,
  required PuzzleImage animalSelected,
}) {
  return showDialog(
    context: context,
    builder: (_) => WinnerDialog(
      moves: moves,
      time: time,
      animalSelected: animalSelected,
    ),
  );
}

class WinnerDialog extends StatelessWidget {
  final int moves;
  final int time;
  final PuzzleImage animalSelected;

  const WinnerDialog({
    Key? key,
    required this.moves,
    required this.time,
    required this.animalSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = S.current;
    return Center(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: darkColor,
        child: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    texts.great_job,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    animalSelected.assetPath,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: Text(
                    animalSelected.info,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      height: 1.2,
                      fontSize: 18,
                    ),
                  )),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            PuzzleIcons.watch,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          Text(
                            parseTime(time),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${texts.movements} $moves",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Container(
                height: 0.6,
                color: Colors.white24,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    texts.ok,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
