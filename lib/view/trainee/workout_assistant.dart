import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/exerciseinfo_page.dart';
import 'package:gymnopolis/view/trainee/workout_assistant_exercise.dart';


class WorkoutAssistantPage extends StatefulWidget {
  static String tag = 'login-page'; //tag for router

  final String name;

  final List<Exercise> exercises;

  WorkoutAssistantPage(this.name,this.exercises);
  @override
  WorkoutAssistantPageState createState() => WorkoutAssistantPageState();
}

class WorkoutAssistantPageState extends State<WorkoutAssistantPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(widget.name),

      ),
      body: new ExerciseList(widget.exercises), //List displayed her
    );
  }
}

class ExerciseList extends StatelessWidget {

  final List<Exercise> _exercises;

  ExerciseList(this._exercises);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _exercises.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutAssistantExercisePage()),
              );},
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: Center(
                  child: new ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.0,
                        child: Image.asset('assets/benchpress3.png')),
                    title : new Text(_exercises[index].name, style: new TextStyle(fontSize: 22.0)),
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