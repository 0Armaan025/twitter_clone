import 'package:flutter/material.dart';

class ErrorText extends StatefulWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  State<ErrorText> createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.error),
    );
  }
}


class ErrorPage extends StatefulWidget {
  final String error;
  
  const ErrorPage({super.key, required this.error});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(error: widget.error),
    );
  }
}