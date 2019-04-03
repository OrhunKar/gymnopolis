import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';



class ExerciseInfoPage extends StatelessWidget {
  static String tag = 'exerciseinfo-page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
      ),
      body: new Text("The Bench Press is a full body, compound exercise. It works your chest, shoulders and triceps most. It's the most effective exercise to gain upper-body strength and muscle mass because it's the upper-body exercise you'll lift most weight on (more than Overhead Press). The bigger your bench, the bigger your chest."), //List displayed here
    );
  }
}

