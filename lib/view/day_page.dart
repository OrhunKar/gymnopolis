import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/exerciseinfo_page.dart';


class DayPage extends StatelessWidget {
  static String tag = 'day-page';

  final List<Exercise> exercises = Exercise.allExercises();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: null,
      child: Icon(Icons.fitness_center)),
      
      appBar: AppBar(
        title: Text('Workout Plan'),
        leading: new Container(),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.edit), onPressed: null)
        ],
      ),
      body: new ExerciseList(exercises), //List displayed here
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //This prevents type to change to shifting
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.directions_bike),
            title: new Text('Workout'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_dining),
            title: new Text('Nutrition'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.school),
            title: new Text('Trainers'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: new Text('Profile')
          )
        ],
      ),
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
                MaterialPageRoute(builder: (context) => ExerciseInfoPage()),
              );},
          child: new ListTile(
              title : new Text(_exercises[index].name),
              subtitle: new Text(_exercises[index].subtitle()),

          )) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}

