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
    this.height = 28.0,
    this.width = 230.0,
    this.icon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final String label;
  final TextInputType keyboardType;
  final bool obscure;
  final double height;
  final double width;
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

    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscure,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
        onChanged: onChanged,
        controller: controller,
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 2.0,
          ),
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: focusedBorderStyle,
          disabledBorder: borderStyle,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: icon,
        ),
        validator: validator,
      ),
    );
  }
}
