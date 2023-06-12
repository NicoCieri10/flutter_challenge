import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.label,
    required this.keyboardType,
    this.obscure = false,
    this.controller,
    this.icon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final String label;
  final TextInputType keyboardType;
  final bool obscure;
  final TextEditingController? controller;
  final Widget? icon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Color(0xffd5d7dc),
      ),
    );

    final focusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: myThemeLight.primaryColor,
      ),
    );

    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscure,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      onChanged: onChanged,
      controller: controller,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        border: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: focusedBorderStyle,
        disabledBorder: borderStyle,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[400],
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: icon,
      ),
      validator: validator,
    );
  }
}
