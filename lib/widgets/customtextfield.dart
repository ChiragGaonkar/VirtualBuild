import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Color.fromRGBO(103, 103, 103, 1),
      ),
      decoration: InputDecoration(
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
        prefixIcon: const Icon(
          Icons.email,
        ),
        fillColor: Theme.of(context).accentColor,
        filled: true,
        labelText: 'Enter Email',
      ),
    );
  }
}
