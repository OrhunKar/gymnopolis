import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
import 'package:gymnopolis/model/InstructorModels/Certificates.dart';
import 'package:gymnopolis/view/instructor/instructor_instructorservice.dart';
import 'package:gymnopolis/view/trainee/service_page.dart';

import '../instructors_page.dart';

class InstructorInstructorProfilePage extends StatefulWidget {
  static String tag = 'trainer-profile-page';
  int id;
  Trainer t;
  var c;
  var a;
  InstructorInstructorProfilePage(this.id){
    t = Trainer.allTrainers()[id-1];
  }
  List<Widget> topBar(BuildContext context){
    return <Widget>[
      new IconButton(icon: new Icon(Icons.message), onPressed: null),
      new IconButton(icon: new Icon(Icons.people), onPressed: null),

    ];
  }

  createState() {
    return InstructorInstructorProfilePageState();
  }
}

@override
class InstructorInstructorProfilePageState extends State<InstructorInstructorProfilePage> {

  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;
    String printCertificateList(List e) {
      String str ="";
      for (int i = 0; i<e.length; i++){
        str = str + (e[i].toString()) + "\n";

      }
      return str;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.t.fullname),

      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InstructorCard(widget.t.id, widget.t.fullname,widget.t.responsive_rating,widget.t.effective_rating,widget.t.overall_rating,widget.t.location, widget.t.profession,widget.t.picture),

              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Wrap(

                  children: <Widget>[
                    Card(
                      child: Container (

                        width: c_width,
                        child: new Column (
                          children: <Widget>[

                            new Text("About me: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                            new Text(widget.t.bio.toString() ,textAlign: TextAlign.start),
                            new Text("Certificates: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                            new Text(printCertificateList(widget.t.certificates) ,textAlign: TextAlign.start),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  new Text("Services Provided by Instructor:",style: TextStyle(fontWeight: FontWeight.bold)),
                  ServiceList(widget.t)
                ],
              )

            ],

          ),
        ),
      ),
    );
  }
}
class ServiceList extends StatelessWidget {

  final Trainer t;

  ServiceList(this.t);


  @override
  Widget build(BuildContext context) {
    List<Service> services = t.services;
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstructorInstructorServicePage(services[index],t.fullname)),
              );},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(
                child: Card(
                  child: new ListTile(
                    leading: new CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: (services[index].rating >= 8) ? Colors.green : Colors.amber,
                        child: new Text(services[index].rating.toString())
                    ),
                    title : new Text(services[index].name, style: new TextStyle(fontSize: 22.0)),
                    subtitle: new Text(services[index].cost.toString()+"\$/Month "),

                  ),
                ),
              ),
            )) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
