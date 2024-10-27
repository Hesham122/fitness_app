import 'package:flutter/material.dart';

class CustomTargetCard extends StatelessWidget {
const  CustomTargetCard({
    super.key,
    required this.title,
    required this.des,
    required this.image,
    required this.route,
    required this.context,
  });

final  String title;
final  String des;
final  String image;
final  Widget route;
final  dynamic context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => route,
              ));
        },
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.deepOrange[400],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 40.0),
                          child: Image(
                            image: AssetImage(image),
                            width: 70,
                            height: 80,
                            //color: Colors.white.withOpacity(.5),
                          ),
                        ),
                        Text(
                          des,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              ),
                        ),
                      ]),
                ))));
  }
}
