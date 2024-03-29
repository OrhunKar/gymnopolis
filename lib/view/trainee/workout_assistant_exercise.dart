///There are some more information to get such as disposing an active ticker look onto it
///TickerProviderStateMixin is useful for implementing custom countdowns

///Some code parts taken from this page
///https://github.com/tensor-programming/flutter_timer_example/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:floating_bubble/floating_bubble.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/DayLog.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/ExerciseLog.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/model/SetResult.dart';
import 'package:youtube_player/youtube_player.dart';

class WorkoutAssistantExercisePage extends StatefulWidget{
  Exercise exercise;
  ExerciseLog exLog;
  int index;

  WorkoutAssistantExercisePage(this.exercise, this.exLog, this.index);

  @override
  WorkoutAssistantExercisePageState createState() => WorkoutAssistantExercisePageState();

}


class WorkoutAssistantExercisePageState extends State<WorkoutAssistantExercisePage> with TickerProviderStateMixin{
  AnimationController controller;
  String value ="0";



  SetResult _result = new SetResult();
  List<SetResult> allResult = new List<SetResult>();


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            ExerciseLog log = new ExerciseLog();
            log.trainee = Trainee.allTrainees()[1];
            log.set = widget.exercise.set;
            log.exercise = widget.exercise;
            log.logs = allResult;
            widget.exLog = log;
            Engine.dayLog.exerciseLog[widget.index] = log;
            Navigator.of(context).pop();
          },
          child: Icon(Icons.check)),
      appBar: AppBar(
        title: Text(widget.exercise.base.name),
      ),

      body: Column(
            children: <Widget>[
              Card(
                child: new ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      child: Image.asset(widget.exercise.base.image)),
                  title : new Text(widget.exercise.base.name, style: new TextStyle(fontSize: 22.0)),
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
                      title: setView(context, index, allResult),
                      //new Text('Set ' + (index +1).toString()),
                    );
                  }
                )
              ),
              YoutubePlayer(
                context: context,
                autoPlay: false,
                source: widget.exercise.base.video,
                quality: YoutubeQuality.HD,
              )
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
                onChanged: (value){
                  _result.kg = int.parse(value);
                },
                decoration: InputDecoration(
                  hintText: "eg. 30",
                  labelText: 'Enter weight',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value){
                  _result.REP = int.parse(value);
                },
                decoration: InputDecoration(
                  hintText: "eg. 12",
                  labelText: 'Enter REP',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value){
                  _result.RPE = int.parse(value);
                },
                decoration: InputDecoration(
                  hintText: "eg. 8",
                  labelText: 'Enter RPE between 1-10',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                allResult.add(_result);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget setView(BuildContext context, int index, List<SetResult> sets){

    int length = sets.length;

    if( length > index ) {
      print(sets[0].kg.toString() + "kg x " + sets[0].REP.toString() +
          " RPE: " + sets[0].RPE.toString());
      return new Text(
          sets[index].kg.toString() + "kg x " + sets[index].REP.toString() +
              " RPE: " + sets[index].RPE.toString());
    }
    else
      return new Text('Set ' + (index +1).toString());

  }







}


