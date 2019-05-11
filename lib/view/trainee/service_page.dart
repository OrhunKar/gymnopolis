import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
import 'package:gymnopolis/view/Page.dart';

class ServicePage extends StatefulWidget with Page{
  static String tag = 'login-page'; //tag for router
  @override
  ServicePageState createState() => ServicePageState();
  Service service;
  String name;
  ServicePage(this.service,this.name);

}

class ServicePageState extends State<ServicePage> {

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column (
                  children: <Widget>[
                    new Text("About the service: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text(widget.service.description.toString() ,textAlign: TextAlign.start),
                    Center(child:
                    new RaisedButton(
                      child: Text("Enroll for "+widget.service.cost.toString()+"\$"),
                      onPressed: () {Navigator.of(context).pop();},
                      color: Colors.green,
                      textColor: Colors.white,
                      elevation: 4))
                  ],
                ),
              ),
            )
          ],
        )



    );

  }
}