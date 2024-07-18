import 'package:flutter/material.dart';
import 'package:smena_temy/app_constants.dart';
import 'package:smena_temy/app_theme.dart';
import 'package:smena_temy/repositories/settings_repository.dart';
import 'package:smena_temy/widgets/button.dart';
import 'package:smena_temy/widgets/scheme_theme.dart';

class SortWindow extends StatefulWidget {
  final SettingsRepository settingsRepository;
  final Future<void> loadThemeMode;
  ThemeMode themeMode;
  AppThemeScheme appThemeScheme;

  SortWindow({
    super.key,
    required this.settingsRepository,
    required this.loadThemeMode,
    required this.themeMode,
    required this.appThemeScheme,
  });

  @override
  State<SortWindow> createState() => _SortWindowState();
}

class _SortWindowState extends State<SortWindow> {
  ThemeMode _selectedThemeMode = ThemeMode.system;
  AppThemeScheme _selectedAppThemeScheme = AppThemeScheme.scheme2;

  @override
  void initState() {
    super.initState();
    _selectedThemeMode = widget.themeMode;
    _selectedAppThemeScheme = widget.appThemeScheme;
  }

  void _updateDataThemeMode(ThemeMode themeMode) {
    setState(() {
      _selectedThemeMode = themeMode;
    });
  }

  void _updateDataAppThemeScheme(AppThemeScheme appThemeScheme) {
    setState(() {
      _selectedAppThemeScheme = appThemeScheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  height: 4,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color(0x2EB5B5B5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppTexts.designTheme,
                      style: AppTextStyles.showWindow
                          .copyWith(color: customTheme!.customTextColor2!),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: theme.primaryColor,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RadioListTileTheme(
                themeMode: ThemeMode.system,
                selectedThemeMode: _selectedThemeMode,
                callback: _updateDataThemeMode,
                title: AppTexts.themeSystem,
              ),
              RadioListTileTheme(
                themeMode: ThemeMode.light,
                selectedThemeMode: _selectedThemeMode,
                callback: _updateDataThemeMode,
                title: AppTexts.themeLight,
              ),
              if (_selectedThemeMode == ThemeMode.light)
                ListSchemeTheme(
                  callback: _updateDataAppThemeScheme,
                  selectedAppThemeScheme: _selectedAppThemeScheme,
                ),
              RadioListTileTheme(
                themeMode: ThemeMode.dark,
                selectedThemeMode: _selectedThemeMode,
                callback: _updateDataThemeMode,
                title: AppTexts.themeDark,
              ),
              if (_selectedThemeMode == ThemeMode.dark)
                ListSchemeTheme(
                  callback: _updateDataAppThemeScheme,
                  selectedAppThemeScheme: _selectedAppThemeScheme,
                ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_selectedThemeMode == ThemeMode.system) {
                        _selectedAppThemeScheme = AppThemeScheme.scheme1;
                      }

                      widget.settingsRepository
                          .setThemeMode(_selectedThemeMode);
                      widget.settingsRepository
                          .setAppThemeScheme(_selectedAppThemeScheme);
                      Navigator.pop(context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        customTheme.customTextColor7!), // Цвет фона
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Цвет текста
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Скругление углов
                    )),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14), // Отступы внутри кнопки
                    ),
                  ),
                  child: Text(
                    'Готово',
                    style: AppTextStyles.logOut,
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