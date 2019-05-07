import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
import 'package:gymnopolis/view/Page.dart';

class InstructorInstructorServicePage extends StatefulWidget with Page{
  static String tag = 'login-page'; //tag for router
  @override
  InstructorInstructorServicePageState createState() => InstructorInstructorServicePageState();
  Service service;
  String name;
  InstructorInstructorServicePage(this.service,this.name);

}

class InstructorInstructorServicePageState extends State<InstructorInstructorServicePage> {

  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.service.name),

        ),
        body:
        Column(
          children: <Widget>[
            Card(
              child: new ListTile(
                leading: new CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: (widget.service.rating >= 8) ? Colors.green : Colors.amber,
                    child: new Text(widget.service.rating.toString())
                ),
                title : new Text(widget.service.name, style: new TextStyle(fontSize: 22.0)),
                subtitle: new Text("by "+widget.name),

              ),
            ),
            Container (
              decoration: BoxDecoration(color: Colors.white),
              width: c_width,
              child: new Column (
                children: <Widget>[
                  new Text("About the service: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text(widget.service.description.toString() ,textAlign: TextAlign.start),

                ],
              ),
            )
          ],
        )



    );

  }
}