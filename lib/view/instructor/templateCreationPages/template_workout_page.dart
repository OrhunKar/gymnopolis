import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';
final List<Exercise> workouts = Workout.allExercises();

class TemplateWorkoutPage extends StatefulWidget {
  static String tag = 'workout-page';

  final String name;

  TemplateWorkoutPage(this.name);

  createState() {
    return TemplateWorkoutState();
  }
}

class TemplateWorkoutState extends State<TemplateWorkoutPage> {

  TemplateWorkoutState();

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage(workouts[index].name, workouts)),
            );},
          child: new ListTile(
              title : new Text(workouts[index].name),
              subtitle: new Text(workouts[index].name + " Hoca"),
              leading: new CircleAvatar(
                  child: new Text("Day " + (workouts[index]).toString())
              )
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}