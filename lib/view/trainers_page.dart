

import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';

class TrainersPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Trainers available at the moment:"
          ),
          SizedBox(height: 10.0,),
        ],
      )
    );
  }

}
class TrainerCard extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 100.0,
    );
  }
}