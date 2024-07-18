import 'package:flutter/material.dart';
import 'package:smena_temy/app_constants.dart';

class Avatar extends StatelessWidget {
  final String avatarAssets;

  const Avatar({super.key, required this.avatarAssets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              avatarAssets,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Center(
            child: Text(
              AppTexts.editAvatar,
              style: AppTextStyles.avatarEdit.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
