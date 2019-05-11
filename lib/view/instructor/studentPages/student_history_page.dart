import 'package:flutter/material.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/view/instructor/studentPages/student_history_day_page.dart';

class StudentHistoryPage extends StatefulWidget{

  static String tag = 'student-history-page';

  final Trainee student;

  StudentHistoryPage(this.student);

  createState() {
    return StudentHistoryPageState();
  }
}

@override
class StudentHistoryPageState extends State<StudentHistoryPage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.student.name),
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentHistoryDayPage(Engine.dayLog.name)));
        },
        child: Card(
          child: ListTile(
            title:new Text(Engine.dayLog.name)
          ),
        ),
      ),
    );
  }
}