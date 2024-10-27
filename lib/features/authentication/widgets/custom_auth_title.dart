import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
const  CustomAuthTitle({super.key, required this.title});

final  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }
}
