import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_puzzle/src/domain/repositories/settings_repository.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';

class ThemeController extends ChangeNotifier {
  final SettingsRepository _settings = GetIt.I.get();

  late bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => ThemeMode.dark;

  ThemeController() {
    _isDarkMode = _settings.isDarkMode;
    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    }
  }

  TextTheme get _textTheme {
    return GoogleFonts.latoTextTheme();
  }

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: lightColor,
        ),
      ),
      textTheme: _textTheme,
      primaryColorLight: lightColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(lightColor.value, swatch),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: darkColor,
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: darkColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: _textTheme
          .merge(
            ThemeData.dark().textTheme,
          )
          .apply(
            fontFamily: _textTheme.bodyMedium!.fontFamily,
          ),
      scaffoldBackgroundColor: const Color(0xff102027),
      primaryColorDark: darkColor,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: darkColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(acentColor),
        trackColor: WidgetStateProperty.all(
          acentColor.withOpacity(0.6),
        ),
      ),
    );
  }

  void toggle() {
    _isDarkMode = !isDarkMode;
    _settings.updateDarkMode(isDarkMode);
    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark,
      );
    }
    notifyListeners();
  }
}
