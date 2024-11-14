import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  Widget suffixIcon;
  final bool obscure;
  Function()? onShowPassword;
  final TextEditingController? controller;
  TextfieldWidget({
    super.key,
    this.onShowPassword,
    this.label,
    this.hint,
    this.suffixIcon = const SizedBox(),
    required this.controller, required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure!,
      controller: controller!,
      decoration: InputDecoration(
        isDense: true, // Add this
        // Adjust padding
        suffixIcon: onShowPassword != null
            ? IconButton(onPressed: onShowPassword, icon: suffixIcon)
            : SizedBox(),

        labelText: label,
        hintStyle: TextStyle(fontSize: 12, height: 3),
        floatingLabelStyle: TextStyle(height: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 20, height: 4),

        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff595959), width: 1.5)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff595959), width: 1.5)),
        hintText: hint,
      ),
    );
  }
}
