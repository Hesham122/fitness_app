import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ReadTextField extends StatelessWidget {
  final String hint;
  final String fieldContent;
  const ReadTextField({super.key, required this.hint, required this.fieldContent});

  @override
  Widget build(BuildContext context) {
   

    return TextField(
      readOnly: true, // Make the TextField read-only
      controller: TextEditingController(text: fieldContent),
      decoration: InputDecoration(
        labelText: hint, // Constant label at the top
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black, // Color for the label text
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colorsapp.darkOrange),
        ),
      ),
    );
  }
}
