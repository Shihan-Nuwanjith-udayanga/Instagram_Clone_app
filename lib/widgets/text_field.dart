import 'package:flutter/material.dart';

class TextInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputKeyboardType;
  final String hintText;

  const TextInputFiled({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputKeyboardType,
    required this.isPassword,
  }) : super(key: key); //key property like as Identifier.

  @override
  Widget build(BuildContext context) {
    //input styles
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: inputKeyboardType,
      obscureText: isPassword,
    );
  }
}
