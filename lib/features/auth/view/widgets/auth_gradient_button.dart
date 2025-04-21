import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const AuthGradientButton({
    super.key,
    required this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient3],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
          overlayColor: Pallete.transparentColor,
          fixedSize: Size(double.infinity, 55),
        ),
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: Pallete.whiteColor,
          ),
        ),
      ),
    );
  }
}
