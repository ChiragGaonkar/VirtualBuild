import 'package:flutter/material.dart';

class TextFieldClass extends StatefulWidget {
  const TextFieldClass({Key? key}) : super(key: key);



  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color.fromRGBO(103, 103, 103, 1)
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Color.fromRGBO(98, 98, 98, 1)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(98, 98, 98, 1), width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(Icons.email,),
        fillColor: Color.fromRGBO(98, 98, 98, 1),
        filled: true,
        labelText: 'Enter Email',
      ),
    );
  }
}
