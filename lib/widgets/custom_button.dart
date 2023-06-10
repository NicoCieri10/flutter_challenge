import 'package:flutter/material.dart';
import 'package:flutter_challenge/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: const Size(
          190.0,
          45.0,
        ),
        backgroundColor: myThemeLight.primaryColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
