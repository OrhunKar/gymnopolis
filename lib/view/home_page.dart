import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  final List<Workout> workouts = Workout.allWorkouts();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.edit), onPressed: null)
        ],
      ),
      body: new WorkoutList(workouts), //List displayed here
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

class WorkoutList extends StatelessWidget {

  final List<Workout> _workouts;

  WorkoutList(this._workouts);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _workouts.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DayPage()),
          );},
          child: new ListTile(
              title : new Text(_workouts[index].name),
              subtitle: new Text(_workouts[index].instructorName + " Hoca"),
              leading: new CircleAvatar(
                  child: new Text((_workouts[index].day).toString())
              )
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}

