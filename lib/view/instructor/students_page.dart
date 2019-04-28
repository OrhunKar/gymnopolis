import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/view/Page.dart';

final List<Trainee> _trainees = Trainee.allTrainees();

class StudentsPage extends StatefulWidget with Page{
  static String tag = 'student-page';

  List<Widget> topBar(BuildContext context){
    return null;
  }

  createState() {
    return StudentsPageState();
  }
}

@override
class StudentsPageState extends State<StudentsPage> {
  String defaultSearch = 'Name Search';
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Students");


  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _trainees.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage()),
            );*/},
          child: new ListTile(
              title : new Text(_trainees[index].name),
              subtitle: new Text(_trainees[index].lastActivity),
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
