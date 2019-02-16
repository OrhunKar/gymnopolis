import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';
final List<Workout> workouts = Workout.allWorkouts();
class InstructorsPage extends StatefulWidget {
  static String tag = 'instructors-page';
  createState() {
    return InstructorsState(workouts);
  }

}


class InstructorsState extends State<InstructorsPage> {
  final List<Workout> _workouts;
  InstructorsState(this._workouts);

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