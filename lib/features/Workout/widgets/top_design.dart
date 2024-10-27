import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'custom_appbar.dart';

class TopDesign extends StatelessWidget {
  const TopDesign({super.key});

  @override
  Widget build(BuildContext context) {
        var sizee = MediaQuery.of(context).size;
    return     Container(
            padding: EdgeInsets.all(sizee.width / 33),
            color: Colorsapp.darkOrange,
            child: const Column(
              children: [
                customAppBar,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 260, // Adjust the width as needed
                      child: Text(
                        'Hesham Mohamed',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure the text color is black
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           color: Colorsapp.secondarycolor,
                    //           shape: BoxShape.circle),
                    //       child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.person,
                    //             color: Colors.white,
                    //             // color: Colorsapp.primarycolor,
                    //           )),
                    //     ),
                    //     const SizedBox(
                    //       width: 12,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           color: Colorsapp.secondarycolor,
                    //           shape: BoxShape.circle),
                    //       child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.settings,
                    //               color: Colors.white,
                    //             // color: Colorsapp.primarycolor,
                    //           )),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  width: double.infinity, // Adjust the width as needed
                  child: Text(
                    '22 male',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Ensure the text color is black
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}