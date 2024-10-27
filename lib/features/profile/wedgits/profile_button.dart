import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final Icon ic;
  final Color? bgcolor;
  final Color? textcolor;
  final Function pressed;
  const ProfileButton(
      {super.key,
      required this.title,
      required this.ic,
      this.bgcolor,
      this.textcolor,
       required this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => pressed(),
        iconAlignment: IconAlignment.end,
        icon: ic,
        style: ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(
                width: 2,
                color: textcolor ?? const Color.fromRGBO(78, 52, 46, 1))),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
            backgroundColor: WidgetStatePropertyAll(
                bgcolor ?? const Color.fromRGBO(78, 52, 46, 1)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        label: Text(
          title,
          style: TextStyle(fontSize: 22, color: textcolor ?? Colors.white),
        ));
  }
}
