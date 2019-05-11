import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/model/simple_line_chart.dart';
import 'package:gymnopolis/view/instructor/messagesPages/private_messages_page.dart';
import 'package:gymnopolis/view/instructor/studentPages/student_history_page.dart';
import 'package:gymnopolis/view/instructor/studentPages/student_workout_page.dart';
import 'package:human_anatomy/human_anatomy.dart';

class StudentProfilePage extends StatefulWidget{

  static String tag = 'student-profile-page';

  final Trainee student;


  StudentProfilePage(this.student);

  createState() {
    return StudentProfilePageState();
  }
}

@override
class StudentProfilePageState extends State<StudentProfilePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.name),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.class_),onPressed:(){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentWorkoutPage(widget.student.name, widget.student.workout)));
            });
          } ,),
          new IconButton(icon: new Icon(Icons.history),onPressed:(){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentHistoryPage(widget.student)));
            });
          } ,),
          new IconButton(icon: new Icon(Icons.chat),onPressed:(){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateMessagesPage(widget.student.name)));
            });
          } ,)
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HumanAnatomy(
                    )
                ),
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 400.0,
                child:  SimpleLineChart.withSampleData(),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 400.0,
                child:  SimpleLineChart.withSampleData(),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 400.0,
                child:  SimpleLineChart.withSampleData(),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 400.0,
                child:  SimpleLineChart.withSampleData(),
              ),
            )
          ],
        ),
      )
    );
  }
}