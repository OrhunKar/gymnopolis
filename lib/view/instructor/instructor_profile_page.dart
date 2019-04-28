import 'package:flutter/material.dart';
import 'package:gymnopolis/view/Page.dart';

class InstructorsProfilePage extends StatefulWidget with Page{
  static String tag = 'instructor-profile-page';

  List<Widget> topBar(BuildContext context){
    return null;
  }

  createState() {
    return InstructorsProfilePageState();
  }
}

@override
class InstructorsProfilePageState extends State<InstructorsProfilePage> {

  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.red,
    );
  }
}