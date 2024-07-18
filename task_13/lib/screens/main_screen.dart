import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smena_temy/app_constants.dart';
import 'package:smena_temy/app_theme.dart';
import 'package:smena_temy/repositories/settings_repository.dart';
import 'package:smena_temy/screens/sort_window.dart';
import 'package:smena_temy/widgets/avatar.dart';
import 'package:smena_temy/widgets/button.dart';

class MainScreen extends StatelessWidget {
  final SettingsRepository settingsRepository;
  final Future<void> loadThemeMode;
  final ThemeMode themeMode;
  final AppThemeScheme appThemeScheme;

  const MainScreen({
    super.key,
    required this.settingsRepository,
    required this.loadThemeMode,
    required this.themeMode,
    required this.appThemeScheme,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();

    void showWindow() {
      showModalBottomSheet(
        context: context,
        backgroundColor: customTheme!.customTextColor4!,
        barrierColor: customTheme.customTextColor5!,
        elevation: 0,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => SortWindow(
          loadThemeMode: loadThemeMode,
          settingsRepository: settingsRepository,
          themeMode: themeMode,
          appThemeScheme: appThemeScheme,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppTexts.appBarTitle,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.iconBack,
            colorFilter: ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                AppTexts.appBarSave,
                style: AppTextStyles.appBarSave
                    .copyWith(color: theme.primaryColor),
              ))
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Avatar(
                      avatarAssets: AppAssets.avatar,
                    ),
                    const SizedBox(height: 24),
                    MyAwards(
                      listAwards: const ['🥇', '🥇', '🥉', '🥈', '🥉'],
                      color: customTheme!.customTextColor1!,
                    ),
                    const SizedBox(height: 24),
                    ButtonProfile(
                      title: AppTexts.name,
                      text: 'Маркус Хассельборг',
                      icon: false,
                      onTap: () {},
                      context: context,
                    ),
                    const SizedBox(height: 8),
                    ButtonProfile(
                      title: AppTexts.email,
                      text: 'MarkusHSS@gmail.com',
                      icon: false,
                      onTap: () {},
                      context: context,
                    ),
                    const SizedBox(height: 8),
                    ButtonProfile(
                      title: AppTexts.dateOfBirth,
                      text: '03.03.1986',
                      icon: false,
                      onTap: () {},
                      context: context,
                    ),
                    const SizedBox(height: 8),
                    ButtonProfile(
                      title: AppTexts.team,
                      text: 'Сборная Швеции',
                      icon: true,
                      onTap: () {},
                      context: context,
                    ),
                    const SizedBox(height: 8),
                    ButtonProfile(
                      title: AppTexts.position,
                      text: 'Скип',
                      icon: true,
                      onTap: () {},
                      context: context,
                    ),
                    const SizedBox(height: 8),
                    ButtonProfile(
                      title: AppTexts.designTheme,
                      text: themeMode == ThemeMode.system
                          ? AppTexts.themeSystem
                          : themeMode == ThemeMode.light
                              ? AppTexts.themeLight
                              : AppTexts.themeDark,
                      icon: true,
                      onTap: showWindow,
                      context: context,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              const ButtonLogOut(),
            ],
          ),
        ),
      ),
    );
  }
}

