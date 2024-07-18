import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smena_temy/repositories/settings_repository.dart';
import 'package:smena_temy/screens/main_screen.dart';
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final SettingsRepository settingsRepository =
      SettingsRepository(preferences: preferences);

  runApp(MyApp(
    settingsRepository: settingsRepository,
  ));
}

class MyApp extends StatefulWidget {
  final SettingsRepository settingsRepository;

  const MyApp({super.key, required this.settingsRepository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  AppThemeScheme appThemeScheme = AppThemeScheme.scheme1;

  @override
  void initState() {
    super.initState();
    loadThemeMode();
  }

  Future<void> loadThemeMode() async {
    themeMode = await widget.settingsRepository.getThemeMode();
    appThemeScheme = await widget.settingsRepository.getAppThemeScheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData().getThemeData(appThemeScheme, Brightness.light),
      darkTheme: AppThemeData().getThemeData(appThemeScheme, Brightness.dark),
      themeMode: themeMode,
      home: MainScreen(
        settingsRepository: widget.settingsRepository,
        loadThemeMode: loadThemeMode(),
        themeMode: themeMode,
        appThemeScheme: appThemeScheme,
      ),
    );
  }
}
