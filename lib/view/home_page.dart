import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:gymnopolis/view/nutrition_page.dart';
import 'package:gymnopolis/view/workout_page.dart';
import 'package:gymnopolis/view/profile_page.dart';
import 'package:gymnopolis/view/instructors_page.dart';
import 'package:gymnopolis/view/messages_page.dart';
import 'package:gymnopolis/model/Graph.dart';
import 'package:gymnopolis/view/settings_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gymnopolis/view/Page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  createState() {
    return HomePageState();
  }
}



  @override
  class HomePageState extends State<HomePage>{

    int _currentIndex = 0;
    NutritionPage _nutritionPage;
    WorkoutPage _workoutPage;
    ProfilePage _profilePage;
    InstructorsPage _instructorsPage;
    MessagesPage _messagesPage;
    List<Widget> pages;
    Widget currentPage;
    List<Page> thisPages;
    Page thisPage;
    List<String> pageNames;
    void initState(){
      _workoutPage = WorkoutPage();
      _nutritionPage = NutritionPage();
      _messagesPage = MessagesPage();
      _instructorsPage = InstructorsPage();
      _profilePage = ProfilePage(new Graph().getData(), animate:false);
      pages = [_workoutPage, _nutritionPage, _messagesPage, _instructorsPage, _profilePage];
      thisPages = [_workoutPage, _nutritionPage, _messagesPage, _instructorsPage, _profilePage];
      pageNames = ['Workout Plan', 'Nutrition Plan', 'Messages', 'Instructors', 'Profile'];
      currentPage = _workoutPage; //Always workouts will be displayed first
      thisPage = _workoutPage;
      super.initState();
    }
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(pageNames[_currentIndex]),
          actions: thisPage.topBar(context),
        ),
        body:currentPage,
        bottomNavigationBar: BottomNavigationBar(

          onTap: (int index){
            setState(() {
              _currentIndex=index;
              currentPage = pages[index];
              thisPage = thisPages[index];
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



