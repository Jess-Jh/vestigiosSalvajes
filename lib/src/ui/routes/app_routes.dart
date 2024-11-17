import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/game_view.dart';
import 'package:my_puzzle/src/ui/pages/menu.dart';
import 'package:my_puzzle/src/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.menu: (_) => const TriviaApp(),
    Routes.game: (_) => const GameView(),
  };
}
