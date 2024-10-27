import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
const  CustomTextFormField({super.key,
    required this.keyboardType,
    required this.controller,
    required this.decoration,
    required this.validator,
    this.obscure = false,
  });
  // ignore: prefer_typing_uninitialized_variables
  final  controller;
final  TextInputType keyboardType;
final  InputDecoration decoration;
final  String? Function(dynamic value) validator;
final  bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: decoration,
      validator: validator,
      obscureText: obscure,
    );
  }
}
