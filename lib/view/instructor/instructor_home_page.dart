import 'package:flutter/material.dart';

import 'package:gymnopolis/view/instructor/instructor_instructors_page.dart';
import 'package:gymnopolis/view/instructor/instructor_messages_page.dart';
import 'package:gymnopolis/view/instructor/instructor_profile_page.dart';
import 'package:gymnopolis/view/instructor/students_page.dart';
import 'package:gymnopolis/view/instructor/templates_page.dart';

class InstructorHomePage extends StatefulWidget {
  static String tag = 'instructor-home-page';

  createState() {
    return InstructorHomePageState();
  }
}

@override
class InstructorHomePageState extends State<InstructorHomePage> {
  String defaultSearch = 'Name Search';
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Students");

  int _currentIndex = 0;
  StudentsPage _studentsPage;
  InstructorsInstructorPage _instructorsInstructorPage;
  InstructorsMessagesPage _instructorsMessagesPage;
  InstructorsProfilePage _instructorsProfilePage;
  TemplatesPage _templatesPage;



  List<Widget> pages;
  Widget currentPage;
  List<String> pageNames;

  void initState(){
    _studentsPage = StudentsPage();
    _templatesPage = TemplatesPage();
    _instructorsMessagesPage = InstructorsMessagesPage();
    _instructorsInstructorPage = InstructorsInstructorPage();
    _instructorsProfilePage = InstructorsProfilePage();

    pages = [_studentsPage, _templatesPage, _instructorsMessagesPage, _instructorsInstructorPage, _instructorsProfilePage];
    pageNames = ['Students', 'Templates', 'Messages', 'Instructors', 'Profile'];
    currentPage = _studentsPage; //Always students will be displayed first
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageNames[_currentIndex]),
        actions: <Widget>[
          new IconButton(icon: actionIcon,onPressed:(){
            setState(() {
              if ( this.actionIcon.icon == Icons.search){
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.green,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search,color: Colors.green),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );}
              else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("AppBar Title");
              }
            });
          } ,)
          ,]
      ),
      body: currentPage,//body: ,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.purple,
        onTap: (int index) {
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
            icon: new Icon(Icons.people),
            title: new Text('Students'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.title),
            title: new Text('Templates'),
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



