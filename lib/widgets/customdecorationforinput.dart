import 'package:flutter/material.dart';

InputDecoration customDecorationForInput(
  BuildContext context,
  String inputLabel,
  IconData inputIcon,
) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(98, 98, 98, 1),
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(98, 98, 98, 1),
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    prefixIcon: Icon(
      inputIcon,
    ),
    fillColor: Theme.of(context).accentColor,
    filled: true,
    labelText: inputLabel,
  );
}
