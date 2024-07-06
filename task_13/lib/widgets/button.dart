import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smena_temy/app_constants.dart';
import 'package:smena_temy/app_theme.dart';

class RadioListTileTheme extends StatelessWidget {
  final String title;
  final ThemeMode themeMode;
  final ThemeMode selectedThemeMode;
  final Function(ThemeMode) callback;

  const RadioListTileTheme({
    super.key,
    required this.themeMode,
    required this.selectedThemeMode,
    required this.callback,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();

    return RadioListTile<ThemeMode>(
      title: Text(
        title,
        style: AppTextStyles.logOut
            .copyWith(color: customTheme!.customTextColor2!),
      ),
      value: themeMode,
      groupValue: selectedThemeMode,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      activeColor: theme.primaryColor,
      onChanged: (ThemeMode? value) {
        if (value != null) {
          callback(value);
        }
      },
    );
  }
}

class ButtonLogOut extends StatelessWidget {
  const ButtonLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gainsborough),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
          child: Text(
        AppTexts.logOut,
        style: AppTextStyles.logOut.copyWith(color: AppColors.orangeRedCrayola),
      )),
    );
  }
}

class ButtonProfile extends StatelessWidget {
  final String title;
  final String text;
  final bool icon;
  final Function onTap;
  final BuildContext context;

  const ButtonProfile({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: customTheme!.customTextColor3!,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.myAwardsTitle
                      .copyWith(color: customTheme.customTextColor1!),
                ),
                Text(
                  text,
                  style: AppTextStyles.myAwardsTitle
                      .copyWith(color: customTheme.customTextColor2!),
                ),
              ],
            ),
            if (icon)
              SvgPicture.asset(
                AppAssets.iconNextButton,
                colorFilter:
                    ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
              ),
          ],
        ),
      ),
    );
  }
}

class MyAwards extends StatelessWidget {
  final Color color;
  final List<String> listAwards;

  const MyAwards({super.key, required this.listAwards, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.myAwards,
          style: AppTextStyles.myAwardsTitle.copyWith(color: color),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16.0,
          children: List.generate(
            listAwards.length,
            (index) =>
                Text(listAwards[index], style: AppTextStyles.myAwardsIcons),
          ),
        )
      ],
    );
  }
}