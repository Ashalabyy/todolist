import 'package:flutter/material.dart';

final defaultInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey.withOpacity(0.08),
  contentPadding: const EdgeInsets.only(left: 10.0),
  hintStyle: const TextStyle(
    fontSize: 14,
  ),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    gapPadding: 4.0,
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.2),
    ),
  );
}
