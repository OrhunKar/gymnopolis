import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';
import 'package:gymnopolis/view/workout_page.dart';
class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  createState() {
    return HomePageState();
  }
}


  @override
  class HomePageState extends State<HomePage> {
    int _currentIndex = 0;
    NutritionPage _nutritionPage;
    WorkoutPage _workoutPage;
    List<Widget> pages;
    Widget currentPage;
    void initState(){
      _workoutPage = WorkoutPage();
      _nutritionPage = NutritionPage();
      pages = [_workoutPage, _nutritionPage];
      currentPage = _workoutPage;
      super.initState();
    }
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Workout Plan'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.edit), onPressed: null)
          ],
        ),
        body:currentPage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              _currentIndex=index;
              currentPage = pages[index];
            });
          },
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
  }



