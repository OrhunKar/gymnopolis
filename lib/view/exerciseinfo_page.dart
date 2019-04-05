import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';



class ExerciseInfoPage extends StatefulWidget {
  static String tag = 'exerciseinfo-page';

  final name;

  ExerciseInfoPage(this.name);

  @override
  ExerciseInfoPageState createState() {
    return ExerciseInfoPageState();
  }


}

class ExerciseInfoPageState extends State<ExerciseInfoPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: new Text("The Bench Press is a full body, compound exercise. It works your chest, shoulders and triceps most. It's the most effective exercise to gain upper-body strength and muscle mass because it's the upper-body exercise you'll lift most weight on (more than Overhead Press). The bigger your bench, the bigger your chest."), //List displayed here
    );
  }
}

