import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? errorText;
  final String labelText;
  final IconData prefixIcon;
  final VoidCallback? onSuffixIconPressed;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  const LoginTextField({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.onSuffixIconPressed,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xFFF25700),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFFF25700)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color(0xFFF25700)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color(0xFFF25700)),
        ),
        prefixIcon: Icon(prefixIcon, color: Color(0xFFF25700)),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: Color(0xFFF25700)),
          onPressed: onSuffixIconPressed,
        )
            : null,
        errorText: errorText,
      ),
    );
  }
}
