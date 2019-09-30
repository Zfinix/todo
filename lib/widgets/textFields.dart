import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/utils/validator.dart';

class TaskTextField extends StatelessWidget {
  final  controller;
  const TaskTextField( {this.controller,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (isEmail(value)) {
          controller.emailC.text = value;
          return null;
        } else if (value.isEmpty) {
          return "This field can't be left empty";
        } else {
          return "This Field is Invalid";
        }
      },
      maxLines: 70,
      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey[400]),
          border: InputBorder.none,
         
          labelText: 'What are you planning?'),
      keyboardType: TextInputType.text,
    );
  }
}