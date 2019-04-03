import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';


class WorkoutPage extends StatefulWidget {
  static String tag = 'workout-page';

  createState() {
    return WorkoutState();
  }
}

class WorkoutState extends State<WorkoutPage> {

  Workout _workout = Workout("workout1", "Can Hoca");

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemCount: _workout.allWorkouts().length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage(_workout.allWorkouts()[index].name, _workout.allWorkouts()[index].exerciseList),
              )
            );},
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Center(
                child: new ListTile(
                    title : new Text(_workout.allWorkouts()[index].name, style: new TextStyle(fontSize: 22.0)),
                    subtitle: new Text(_workout.instructorName + " Hoca", style: new TextStyle(fontStyle: FontStyle.italic)),
                    leading: new CircleAvatar(
                        child: new Text((index+1).toString())
                    )
                ),
              ),
            ),
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}