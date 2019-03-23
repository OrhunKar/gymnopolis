//Log In page design inspired from https://github.com/putraxor/flutter-login-ui

import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';

class InstructorsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Trainers available at the moment:"
            ),
            SizedBox(height: 10.0,),
            InstructorCard()
          ],
        )
    );
  }

}
class InstructorCard extends StatelessWidget{
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0),),
            border: Border.all(color: Colors.deepOrange),

          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("sa")
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}