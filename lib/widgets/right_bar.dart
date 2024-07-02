//importing elements outside of this file to be used on the left side of the UI design
import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/material.dart';

//Stateless Widgets are the widgets that cannot be changed after compiled
//Creating a RightBar that is immune to other factors
class RightBar extends StatelessWidget {
  //barWidth is a variable of class RightBar, which REQUIRES
  //to be Constructed. Thus, a constant of the construction of the RightBar class
  //is Required
  final double barWidth;

  //constr
  //Super keyword is used to call parent class's methods, constructor, and properties in the child class
  const RightBar({super.key, required this.barWidth});
  //barWidth property is required, defined by required keyword

  @override
  Widget build(BuildContext context) {
    //Row because it is a vertical thing
    return Row(
      //Alignment aligns to the end of left
      mainAxisAlignment: MainAxisAlignment
          .end, //MainAxisAlignment changes to start because now it is on the right, basically
      //the end of the screen
      children: [
        //Container is where it holds details of a thing's decoration, height, width, etc
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              //const is added before BorderRadius for BorderRadius on the left bars to have better performance.
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: accentHexColor),
        )
      ],
    );
  }
}
