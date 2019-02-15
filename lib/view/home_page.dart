import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  createState() {
    return HomePageState();
  }
}
  final List<Workout> workouts = Workout.allWorkouts();

  @override
  class HomePageState extends State<HomePage> {
    int _currentIndex = 0;
    final List<Widget> _children = [   PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)];
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
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          //This prevents type to change to shifting
          currentIndex: _currentIndex,
          // this will be set when a new tab is tapped
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
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
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

