import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/exerciseinfo_page.dart';
import 'package:gymnopolis/view/trainee/workout_assistant.dart';

class DayPage extends StatefulWidget {
  static String tag = 'day-page';

  final String name;
  final List<Exercise> exercise;

  DayPage(this.name, this.exercise);

  @override
  DayPageState createState() {
    return new DayPageState();
  }
}

class DayPageState extends State<DayPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(
          context, MaterialPageRoute(builder: (context) => WorkoutAssistantPage(widget.name, widget.exercise)));},
      child: Icon(Icons.fitness_center)),

      appBar: AppBar(
        title: Text(widget.name),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.edit), onPressed: null)
        ],
      ),
      body: new ExerciseList(widget.exercise), //List displayed here
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
                MaterialPageRoute(builder: (context) => ExerciseInfoPage(_exercises[index].name)),
              );},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
              child: Card(
                child: new ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.0,
                        child: Image.asset('assets/benchpress3.png')),
                    title : new Text(_exercises[index].name, style: new TextStyle(fontSize: 22.0)),
                    subtitle: new Text(_exercises[index].subtitle()),

                ),
              ),
            ),
          )) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}

