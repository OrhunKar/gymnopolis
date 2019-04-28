import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
class InstructorsProfilePage extends StatefulWidget {
  static String tag = 'instructor-profile-page';

  createState() {
    return InstructorsProfilePageState();
  }
}

@override
class InstructorsProfilePageState extends State<InstructorsProfilePage> {

  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.red,
    );
  }
}