//Log In page design inspired from https://github.com/putraxor/flutter-login-ui

import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';

class InstructorsPage extends StatefulWidget {


  @override
  InstructorsPageState createState() {
    return new InstructorsPageState();
  }
}

class InstructorsPageState extends State<InstructorsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Text(
                    "Trainers available at the moment:"
                ),
              ),
              SizedBox(height: 10.0,),
              ListView(
                shrinkWrap:true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children:<Widget>[
              InstructorCard("Abdülrezzak Bin hayyamullah",4.5,70,"Boxing Trainer" ),
              InstructorCard("Abdülrezzak Bin hayyamullah",4.5,70,"Boxing Trainer" ),
              InstructorCard("Abdülrezzak Bin hayyamullah",4.5,70,"Boxing Trainer" ),
              InstructorCard("Abdülrezzak Bin hayyamullah",4.5,70,"Boxing Trainer" ),
              ]
              ),
            ],
          ),
        )
    );
  }
}
class InstructorCard extends StatelessWidget{
  String name;
  bool online;
  double star;
  double salary;
  String profession;
  InstructorCard(this.name,this.star,this.salary, this.profession);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
              border: Border.all(color: Colors.blueGrey),

            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(

                    children: <Widget>[
                      Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.hizliresim.com/k9dbRJ.png")
                              )

                          ),

                      ),
                        SizedBox(width: 14.0,),
                        new Text("$profession")
                    ],

                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: <Widget>[
                      new Text("$name"),
                      InstructorDetail(Icons.room, 'Istanbul'),
                      InstructorDetail(Icons.account_balance_wallet, '$salary\$ month'),
                      InstructorDetail(Icons.star, '$star')
                    ],

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class InstructorDetail extends StatelessWidget{

  final IconData iconData;
  final String label;
  InstructorDetail(this.iconData, this.label);

  Widget build(BuildContext context){
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: Colors.white,
      avatar: Icon(iconData, size: 14.0),
    );
  }
}