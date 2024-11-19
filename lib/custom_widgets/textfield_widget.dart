// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  Widget suffixIcon;
  final bool obscure;
  Function()? onShowPassword;
  final TextEditingController? controller;
  final bool? readOnly;
  TextFieldWidget(
      {super.key,
      this.onShowPassword,
      this.label,
      this.hint,
      this.suffixIcon = const SizedBox(),
      required this.controller,
      required this.obscure,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: controller!,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        isDense: true, // Add this
        // Adjust padding

        suffixIcon: onShowPassword != null
            ? IconButton(onPressed: onShowPassword, icon: suffixIcon)
            : const SizedBox(),

        labelText: label,
        hintStyle: const TextStyle(fontSize: 12, height: 3),
        floatingLabelStyle: const TextStyle(height: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(fontSize: 20, height: 4),

        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff595959), width: 1.5)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff595959), width: 1.5)),
        hintText: hint,
      ),
    );
  }
}
