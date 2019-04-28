import 'package:flutter/material.dart';
import 'package:gymnopolis/view/Page.dart';

class InstructorsInstructorPage extends StatefulWidget with Page{
  static String tag = 'instructor-instructors-page';

  List<Widget> topBar(BuildContext context){
    return null;
  }

  createState() {
    return InstructorsInstructorPageState();
  }


}

@override
class InstructorsInstructorPageState extends State<InstructorsInstructorPage> {

  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.purple,
    );
  }
}