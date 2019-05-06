///There are some more information to get such as disposing an active ticker look onto it
///TickerProviderStateMixin is useful for implementing custom countdowns

///Some code parts taken from this page
///https://github.com/tensor-programming/flutter_timer_example/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:floating_bubble/floating_bubble.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';

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
              Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.exercise.set,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      onTap: _showDialog2,
                      leading: CircleAvatar(
                          child: new Text((index + 1).toString())
                      ),
                      title : new Text('Set ' + (index +1).toString()),
                    );
                  }
                )
                ),
              /*Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                )*/



              ],
          ),


      );
  }

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Results"),
          content: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "eg. 3",
                  labelText: 'Number of sets per exercise',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "eg. 12",
                  labelText: 'Maximum rep count',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

