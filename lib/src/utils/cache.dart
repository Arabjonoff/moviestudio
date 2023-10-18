import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String KEY_SELECTED_THEME = 'Theme';
  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(int selectedTheme) {
    preferences!.setInt(KEY_SELECTED_THEME, selectedTheme);
  }

  static bool getDarkMode() {
    int theme = preferences!.getInt(KEY_SELECTED_THEME) ?? 1;
    if (theme == 1) {
      return true;
    } else {
      return false;
    }
  }

  static int getThemeAll() {
    int theme = preferences!.getInt(KEY_SELECTED_THEME) ?? 1;
    return theme;
  }
}
