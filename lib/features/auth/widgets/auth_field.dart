import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/theme.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const AuthField({super.key, required this.controller, required this.hintText});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Pallete.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Pallete.blueColor,
            width: 3, 
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 18),
      ),
    
    );
  }
}