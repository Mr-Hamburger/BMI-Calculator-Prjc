import 'package:flutter/material.dart';
import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//creating a class that is inherited from the original class State
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  //build method that returns a scaffold
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //decorating the title
          title: Text("BMI Calculator",
              style: TextStyle(
                  color: accentHexColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 45)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        //decorating the whole app
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //This display the top left number
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height (In Meters)",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                    ),
                    //You can add multiple containers in a Row(), or something like that
                  ),
                  Container(
                    width: 180,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight (In Kg)",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                    ),
                  )
                ],
              ),
              //This is now going vertically
              const SizedBox(
                height: 30,
              ),

              //Gesture Detector captures user taps, drags, etc clicking interactions.
              //onTap: () => directly points to result of a tap
              //onTap: (){...} allows a calculation or such logic to be implemented in
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have a normal weight";
                    } else {
                      _textResult = "You are under weight";
                    }
                  });
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor),
                    ),
                  )),
              //Now adding the bar decos
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 40),
              const SizedBox(
                height: 10,
              ),
              const LeftBar(
                barWidth: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              const LeftBar(barWidth: 20),
              const SizedBox(
                height: 10,
              ),
              const RightBar(barWidth: 60),
              const SizedBox(
                height: 10,
              ),
              const RightBar(barWidth: 80),
              const SizedBox(
                height: 10,
              ),
              const RightBar(barWidth: 40)
            ],
          ),
        ));
  }
}
