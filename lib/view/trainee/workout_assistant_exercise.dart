///There are some more information to get such as disposing an active ticker look onto it
///TickerProviderStateMixin is useful for implementing custom countdowns

///Some code parts taken from this page
///https://github.com/tensor-programming/flutter_timer_example/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:floating_bubble/floating_bubble.dart';
import 'package:gymnopolis/model/Exercise.dart';

class WorkoutAssistantExercisePage extends StatefulWidget{
  Exercise exercise;
  WorkoutAssistantExercisePage(this.exercise);

  @override
  WorkoutAssistantExercisePageState createState() => WorkoutAssistantExercisePageState();

}

class WorkoutAssistantExercisePageState extends State<WorkoutAssistantExercisePage> with TickerProviderStateMixin{
  AnimationController controller;
  String value ="0";


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),

      body: Column(
            children: <Widget>[
              Card(
                child: new ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      child: Image.asset(widget.exercise.image)),
                  title : new Text(widget.exercise.name, style: new TextStyle(fontSize: 22.0)),
                  subtitle: new Text(widget.exercise.subtitle()),

                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'kg',

                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'reps',
                          ),
                        ),

                      ],
                    )
                  ],
                )
                )



              ],
          ),


      );
  }
}
