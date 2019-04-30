import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/view/instructor/messagesPages/private_messages_page.dart';

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

            });
          } ,),
          new IconButton(icon: new Icon(Icons.history),onPressed:(){
            setState(() {

            });
          } ,),
          new IconButton(icon: new Icon(Icons.chat),onPressed:(){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateMessagesPage(widget.student.name)));
            });
          } ,)
        ]
      ),
      body: Container(
        height: 300.0,
        color: Colors.red,
      ),
    );
  }
}