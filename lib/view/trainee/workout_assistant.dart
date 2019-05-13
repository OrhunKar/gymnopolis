import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/DayLog.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/trainee/workout_assistant_exercise.dart';

class WorkoutAssistantPage extends StatefulWidget {
  static String tag = 'login-page'; //tag for router
  //final DayLog daylog;
  final String name;
  final List<Exercise> exercises;

  WorkoutAssistantPage(this.name, this.exercises);

  @override
  WorkoutAssistantPageState createState() => WorkoutAssistantPageState();
}

class WorkoutAssistantPageState extends State<WorkoutAssistantPage> {
  DayLog dayLog = new DayLog();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          content: new Text("Would you like to complete and save your workout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                //stopWatch();
                Navigator.popUntil(context, ModalRoute.withName('home-page'));
              },
            ),
          ],
        );
      },
    );
  }
  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          content: new Text("If you exit your workout will not be saved. Would you like to exit anyway?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                stopWatch();
                Navigator.popUntil(context, ModalRoute.withName('home-page'));
              },
            ),
          ],
        );
      },
    );
  }

  Stopwatch watch = new Stopwatch();
  Timer timer;

  String elapsedTime = '';
  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 1000), updateTime);
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  resetWatch() {
    watch.reset();
    setTime();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);

    });
  }

  transformMilliSeconds(int milliseconds) {
    //Thanks to Andrew
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      var milliseconds = watch.elapsedMilliseconds;
      int hundreds = (milliseconds / 10).truncate();
      int seconds = (hundreds / 100).truncate();
      int minutes = (seconds / 60).truncate();

      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
        if (seconds > 59) {
          seconds = seconds - (59 * minutes);
          seconds = seconds - minutes;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  //  startWatch();
    return new WillPopScope(
      onWillPop: (){
        _showDialog2();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _showDialog ,
          child: Icon(Icons.check)
        ),
        appBar: AppBar(title: Text(elapsedTime)),
        body: new ExerciseList(widget.exercises, this.dayLog), //List displayed her
      ),
    );
  }
}

class ExerciseList extends StatelessWidget {

  final List<Exercise> _exercises;


  final DayLog dayLog;

  ExerciseList(this._exercises, this.dayLog);

  @override
  Widget build(BuildContext context) {


    return new ListView.builder(
      itemCount: _exercises.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutAssistantExercisePage(_exercises[index], dayLog.exerciseLog[index], index)),
              );},
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: Center(
                  child: new ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.0,
                        child: Image.asset(_exercises[index].base.image)),
                    title : new Text(_exercises[index].base.name, style: new TextStyle(fontSize: 22.0)),
                    subtitle: new Text("0/" + _exercises[index].set.toString() + " Sets completed", style: new TextStyle(fontSize: 20)),

                  ),
                ),
              ),
            )) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}