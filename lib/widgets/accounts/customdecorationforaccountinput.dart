import 'package:flutter/material.dart';

InputDecoration customDecorationForAccountInput(
  BuildContext context,
  String inputLabel,
  TextStyle? styleOfText,
) {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).secondaryHeaderColor,
      ),
    ),
    labelText: inputLabel,
    labelStyle: styleOfText,
    fillColor: Theme.of(context).primaryColor,
  );
}
