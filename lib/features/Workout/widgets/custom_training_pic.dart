import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTrainingPic extends StatelessWidget {
  final String pic;
  final bool isfavorite;
const  CustomTrainingPic({super.key, required this.pic, required this.isfavorite});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: sizee.height/45, horizontal:sizee.width/30),
      height: sizee.height/1.9,
      // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colorsapp.darkOrange,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite, 
                      color:isfavorite? Colorsapp.darkOrange:Colors.white,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 230,
            child: AspectRatio(
                aspectRatio: 1.8 / 1.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(pic), fit: BoxFit.fill),
                  ),
                )),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "QUICK AND\nDYNAMIC",
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
