import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';


class DayPage extends StatelessWidget {
  static String tag = 'day-page';

  final List<Exercise> exercises = Exercise.allExercises();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
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
            icon: new Icon(Icons.group),
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
          onTap: () => debugPrint("tapped" + _exercises[index].name),
          child: new ListTile(
              title : new Text(_exercises[index].name),
              subtitle: new Text(_exercises[index].set.toString() +  " Set "),
              leading: new CircleAvatar(
                  child: new Text((index.toString())
              )
          ),
          )) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}

