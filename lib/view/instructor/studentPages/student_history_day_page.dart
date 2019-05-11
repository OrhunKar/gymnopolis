import 'package:flutter/material.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';

class StudentHistoryDayPage extends StatefulWidget{


  final String dayName;

  StudentHistoryDayPage(this.dayName);

  createState() {
    return StudentHistoryDayPageState();
  }
}

@override
class StudentHistoryDayPageState extends State<StudentHistoryDayPage> {


  Widget build(BuildContext context) {
    List temp = new List();

    List temp2 = Engine.dayLog.exerciseLog;



    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.dayName),
      ),
      body: Card(
        child: ListTile(
            title:new Text("Placeholder")
        ),
      ),
    );
  }
}