import 'package:flutter/material.dart';

class DontorHaveAcc extends StatelessWidget {
  final String text;
  VoidCallback onpress;
  final String text2;
  DontorHaveAcc(
      {required this.text, required this.text2, required this.onpress});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onpress,
          child: Text(
            text2,
            style: const TextStyle(
                color: Color(0xFF00b4d8), fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
