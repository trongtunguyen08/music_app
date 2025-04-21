import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholderText;
  final TextEditingController controller;
  final bool isObscureText;

  const CustomTextField({
    super.key,
    this.isObscureText = false,
    required this.placeholderText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: placeholderText),
      controller: controller,
      obscureText: isObscureText,
      style: TextStyle(fontSize: 16.0),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$placeholderText is missing";
        }
        return null;
      },
    );
  }
}
