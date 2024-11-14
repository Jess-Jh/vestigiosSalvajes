import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_puzzle/src/data/repositories_impl/images_repository_impl.dart';
import 'package:my_puzzle/src/domain/models/puzzle_image.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';
import 'package:provider/provider.dart';

/// widget to show a horizontal pageview with the posible
/// images for the puzzle
class PuzzleOptions extends StatefulWidget {
  final double width;
  final void Function(PuzzleImage option)? animalSelected;
  const PuzzleOptions({Key? key, required this.width, this.animalSelected})
      : super(key: key);

  @override
  State<PuzzleOptions> createState() => _PuzzleOptionsState();
}

class _PuzzleOptionsState extends State<PuzzleOptions>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  int _page = 0;

  @override
  void initState() {
    super.initState();

    _setViewportFraction();
  }

  void _setViewportFraction() {
    double viewportFraction = 0.5;
    if (widget.width >= 400 && widget.width < 600) {
      viewportFraction = 0.4;
    } else if (widget.width >= 600) {
      viewportFraction = 0.2;
    }

    _pageController = PageController(
      viewportFraction: viewportFraction,
    );
  }

  @override
  void didUpdateWidget(covariant PuzzleOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.width != widget.width) {
      _setViewportFraction();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 6),
          child: NotificationListener(
            onNotification: (t) {
              if (t is ScrollEndNotification) {
                if (_page != _pageController.page) {
                  _page = _pageController.page!.round();
                  final image = puzzleOptions[_page];
                  final controller = context.read<GameController>();
                  controller.changeGrid(
                    controller.state.crossAxisCount,
                    image.name != 'Numeric' ? image : null,
                  );

                  widget.animalSelected?.call(image);

                  // if (image.name != 'Numeric' && controller.state.sound) {
                  //   controller.audioRepository.play(
                  //     image.soundPath,
                  //   );
                  // }
                }
              }
              return true;
            },
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemBuilder: (_, index) {
                final item = puzzleOptions[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: darkColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.assetPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: puzzleOptions.length,
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: SmoothPageIndicator(
        //     controller: _pageController, // PageController
        //     count: puzzleOptions.length,
        //     effect: CustomizableEffect(
        //       activeDotDecoration: DotDecoration(
        //         width: 32,
        //         height: 12,
        //         color: Colors.indigo,
        //         rotationAngle: 180,
        //         verticalOffset: 0,
        //         borderRadius: BorderRadius.circular(24),
        //       ),
        //       dotDecoration: DotDecoration(
        //         width: 24,
        //         height: 12,
        //         color: Colors.grey,
        //         borderRadius: BorderRadius.circular(16),
        //         verticalOffset: 0,
        //       ),
        //       spacing: 6.0,
        //       activeColorOverride: (i) => Colors.primaries[i],
        //       inActiveColorOverride: (i) =>
        //           Colors.primaries[i].withOpacity(0.2),
        //     ),
        //     onDotClicked: (index) {
        //       _pageController.animateToPage(
        //         index,
        //         duration: const Duration(milliseconds: 300),
        //         curve: Curves.ease,
        //       );
        //     },
        //   ),
        // ),
        Align(
          alignment: Alignment.topCenter,
          child: Transform.rotate(
            angle: 90 * pi / 180,
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 50,
              color: acentColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
