import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required String labelText,
  String? hintText,
  required Widget prefixIcon,
}) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF87AB)),
      borderRadius: BorderRadius.circular(10.0),
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    hintText: hintText,
    labelText: labelText,
  );
}
