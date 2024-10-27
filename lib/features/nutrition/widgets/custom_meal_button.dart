import 'package:flutter/material.dart';

class CustomMealButton extends StatelessWidget {
  const CustomMealButton(
      {super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange[400],
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "recipes",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Icon(Icons.arrow_forward, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
