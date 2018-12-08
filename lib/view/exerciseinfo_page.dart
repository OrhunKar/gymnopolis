import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';



class ExerciseInfoPage extends StatelessWidget {
  static String tag = 'exerciseinfo-page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.edit), onPressed: null)
        ],
      ),
      body: new Text("The Bench Press is a full body, compound exercise. It works your chest, shoulders and triceps most. It's the most effective exercise to gain upper-body strength and muscle mass because it's the upper-body exercise you'll lift most weight on (more than Overhead Press). The bigger your bench, the bigger your chest."), //List displayed here


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

