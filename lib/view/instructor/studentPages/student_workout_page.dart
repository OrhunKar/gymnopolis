import 'package:flutter/material.dart';

class StudentWorkoutPage extends StatefulWidget{

  static String tag = 'instructor-profile-page';



  createState() {
    return StudentWorkoutPageState();
  }
}

@override
class StudentWorkoutPageState extends State<StudentWorkoutPage> {

  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.red,
    );
  }
}