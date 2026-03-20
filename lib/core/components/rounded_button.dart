import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/color/colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundedButton({
    super.key,
    required this.onPress,
    required this.title,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
