import 'package:flutter/material.dart';

class StudentHistoryPage extends StatefulWidget{

  static String tag = 'student-history-page';



  createState() {
    return StudentHistoryPageState();
  }
}

@override
class StudentHistoryPageState extends State<StudentHistoryPage> {

  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.blue,
    );
  }
}