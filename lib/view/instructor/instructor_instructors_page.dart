import 'package:flutter/material.dart';

class InstructorsInstructorPage extends StatefulWidget {
  static String tag = 'instructor-instructors-page';

  createState() {
    return InstructorsInstructorPageState();
  }
}
class InstructorsInstructorPageState extends State<InstructorsInstructorPage>{
  String defaultSearch = 'Name Search';

  int _currentIndex = 0;

  List<String> pages;
  String currentPage;
  List<String> pageNames;

  void initState(){

    pages = ['students-page', 'templates-page', 'instructor-messages-page', 'instructor-instructors-page', 'instructor-profile-page'];
    pageNames = ['Students', 'Templates', 'Messages', 'Instructors', 'Profile'];
    currentPage = 'students-page'; //Always students will be displayed first
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(pageNames[_currentIndex]),
      ),
      body: InstructorsInstructorPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          Navigator.pushNamed(context, pages[index]);
        },
        type: BottomNavigationBarType.fixed,
        //This prevents type to change to shifting
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text('Workout'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.title),
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

Widget build(BuildContext context) {
  return Container(
    height: 300.0,
    color: Colors.purple,
  );
}
