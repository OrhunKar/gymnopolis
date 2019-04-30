import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
import 'package:gymnopolis/model/InstructorModels/Certificates.dart';

class TrainerProfilePage extends StatefulWidget {
  static String tag = 'trainer-profile-page';
  int id;
  Trainer t;
  TrainerProfilePage(this.id){
    t = Trainer.allTrainers()[id-1];
  }


  createState() {
    return TrainerProfilePageState();
  }
}

@override
class TrainerProfilePageState extends State<TrainerProfilePage> {

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start ,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                widget.t.picture)
                        )

                    ),
                  ),
                  SizedBox(width: 14.0),
                  Center(child: new Text(widget.t.profession +" Instructor"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    new Text("Name: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text(widget.t.fullname ,textAlign: TextAlign.start),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    new Text("Age: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text(widget.t.age.toString() ,textAlign: TextAlign.start),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    new Text("Location: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text(widget.t.location.toString() ,textAlign: TextAlign.start),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    new Text("Rating: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text(widget.t.rating.toString() ,textAlign: TextAlign.start),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Wrap(

                  children: <Widget>[
                   Container (

                     width: c_width,
                     child: new Column (
                      children: <Widget>[
                        new Text("About me: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                        new Text(widget.t.bio.toString() ,textAlign: TextAlign.start),
                  ],
                ),
              )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Wrap(

                  children: <Widget>[
                    Container (

                      width: c_width,
                      child: new Column (
                        children: <Widget>[
                          new Text("Certificates: " ,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(printCertificateList(widget.t.certificates) ,textAlign: TextAlign.start),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
