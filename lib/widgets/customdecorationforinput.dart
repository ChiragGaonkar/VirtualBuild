
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
      borderRadius: BorderRadius.circular(15.0),
    ),
    prefixIcon: Icon(
      inputIcon,
      color: Theme.of(context).secondaryHeaderColor,
    ),
    fillColor: Theme.of(context).canvasColor,
    filled: true,
    labelText: inputLabel,
    labelStyle: Theme.of(context).textTheme.titleSmall,
  );
}
