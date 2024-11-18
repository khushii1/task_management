import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  Widget suffixIcon;

  Function()? onShowPassword;
  final TextEditingController? controller;
  SearchWidget({
    super.key,
    this.onShowPassword,
    this.label,
    this.hint,
    this.suffixIcon = const SizedBox(),
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.grey[200],
        filled: true,
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            borderSide: BorderSide(color: Colors.grey[200]!)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            borderSide: BorderSide(color: Colors.grey[200]!)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            borderSide: BorderSide(color: Colors.grey[200]!)),
        hintText: hint,
      ),
    );
  }
}
