import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';
final List<Workout> workouts = Workout.allWorkouts();
class WorkoutPage extends StatefulWidget {
  static String tag = 'workout-page';
  createState() {
    return WorkoutState(workouts);
  }

}


class WorkoutState extends State<WorkoutPage> {
  final List<Workout> _workouts;
  WorkoutState(this._workouts);

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemCount: _workouts.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage()),
            );},
          child: new ListTile(
              title : new Text(_workouts[index].name),
              subtitle: new Text(_workouts[index].instructorName + " Hoca"),
              leading: new CircleAvatar(
                  child: new Text((_workouts[index].day).toString())
              )
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}