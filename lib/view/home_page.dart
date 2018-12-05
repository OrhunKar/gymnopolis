import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';

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

class WorkoutList extends StatelessWidget {

  final List<Workout> _workouts;

  WorkoutList(this._workouts);

  @override
  Widget build(BuildContext context) {


    return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _buildWorkoutList(),

    );
  }

  List<_WorkoutListItem> _buildWorkoutList() {
    return _workouts.map((workout) => new _WorkoutListItem(workout))
        .toList();
  }

}

class _WorkoutListItem extends ListTile{

  _WorkoutListItem(Workout workout) :
        super(
          title : new Text(workout.name),
          subtitle: new Text(workout.instructorName + " Hoca"),
          onTap: () {},
          leading: new CircleAvatar(
              child: new Text((workout.day).toString())
          )
      );
}
