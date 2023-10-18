import 'dart:ui';

import 'package:moviestudio/src/utils/cache.dart';
ThemePreferences themePreferences = ThemePreferences();
class AppColors{


  static Color bg = ThemePreferences.getDarkMode()?const Color(0xFF15141F):const Color(0xFFFFFFFF);
  static Color search = const Color(0xFF211F30);
  static Color text = const Color(0xFFFFFFFF);
  static Color orange = const Color(0xFFEF2D1A);
  static Color blur = const Color(0xFFDADADA);
  static Color grey = const Color(0xFFBCBCBC);


  static void changeTheme(){
    bg = ThemePreferences.getDarkMode() ? const Color(0xFF15141F) : const Color(0xFFFFFFFF);
    text = ThemePreferences.getDarkMode()? const Color(0xFFFFFFFF):const Color(0xFF211F30);
  }
}