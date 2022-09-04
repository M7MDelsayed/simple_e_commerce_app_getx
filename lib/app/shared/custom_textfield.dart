import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType textInputTypee;
  final bool isPassword;
  final String hintTextt;

  const MyTextField({
    Key? key,
    required this.textInputTypee,
    required this.isPassword,
    required this.hintTextt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputTypee,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintTextt,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}
