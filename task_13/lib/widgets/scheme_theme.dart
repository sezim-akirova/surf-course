import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smena_temy/app_constants.dart';
import 'package:smena_temy/app_theme.dart';

class ListSchemeTheme extends StatefulWidget {
  final Function(AppThemeScheme) callback;
  final AppThemeScheme selectedAppThemeScheme;
  const ListSchemeTheme(
      {super.key,
      required this.callback,
      required this.selectedAppThemeScheme});

  @override
  State<ListSchemeTheme> createState() => _ListSchemeThemeState();
}

class _ListSchemeThemeState extends State<ListSchemeTheme> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Цветовая схема',
            style: AppTextStyles.myAwardsTitle
                .copyWith(color: customTheme!.customTextColor1!),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SchemeTheme(
                  icon: AppAssets.iconScheme1,
                  appThemeScheme: AppThemeScheme.scheme1,
                  selectedAppThemeScheme: widget.selectedAppThemeScheme,
                  callback: widget.callback,
                  title: 'Схема 1',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SchemeTheme(
                  icon: AppAssets.iconScheme2,
                  appThemeScheme: AppThemeScheme.scheme2,
                  selectedAppThemeScheme: widget.selectedAppThemeScheme,
                  callback: widget.callback,
                  title: 'Схема 2',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SchemeTheme(
                  icon: AppAssets.iconScheme3,
                  appThemeScheme: AppThemeScheme.scheme3,
                  selectedAppThemeScheme: widget.selectedAppThemeScheme,
                  callback: widget.callback,
                  title: 'Схема 3',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SchemeTheme extends StatelessWidget {
  final String title;
  final AppThemeScheme appThemeScheme;
  final AppThemeScheme selectedAppThemeScheme;
  final String icon;
  final Function(AppThemeScheme) callback;
  const SchemeTheme(
      {super.key,
      required this.icon,
      required this.appThemeScheme,
      required this.selectedAppThemeScheme,
      required this.callback,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return GestureDetector(
      onTap: () {
        callback(appThemeScheme);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: customTheme!.customTextColor6!,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: selectedAppThemeScheme == appThemeScheme
                  ? theme.primaryColor
                  : Colors.black.withOpacity(0),
            )),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 4),
            Text(
              title,
              style: AppTextStyles.avatarEdit.copyWith(
                  color: selectedAppThemeScheme == appThemeScheme
                      ? customTheme.customTextColor2!
                      : customTheme.customTextColor1!),
            ),
          ],
        ),
      ),
    );
  }
}
