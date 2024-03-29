//Log In page design inspired from https://github.com/putraxor/flutter-login-ui

import 'package:flutter/material.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:gymnopolis/view/trainee/trainer_profile_page.dart';
import 'package:gymnopolis/model/InstructorModels/Trainer.dart';
class InstructorsPage extends StatefulWidget with Page{


  @override
  InstructorsPageState createState() {
    return new InstructorsPageState();
  }

  List<Widget> topBar(BuildContext context){
    return null;
  }
}

class InstructorsPageState extends State<InstructorsPage> {
   List<Trainer> _trainer = Trainer.allTrainers();
   List<Widget> cards = new List<Widget>(); //A list of Widgets


  @override
  Widget build(BuildContext context) {

    //Write for loops inside build
    //build method always returns a widget
    for (int i = 0; i < _trainer.length; ++i) {
      int id = _trainer[i].id;
      String name = _trainer[i].fullname;
      double reponsive_rating = _trainer[i].responsive_rating;
      double effective_rating = _trainer[i].effective_rating;
      double overall_rating = _trainer[i].overall_rating;
      String location = _trainer[i].location;
      String profession = _trainer[i].profession;
      String picture = _trainer[i].picture;
      InstructorCard iCard;
      iCard = new InstructorCard(id, name, reponsive_rating,effective_rating,overall_rating, location,profession , picture);
      cards.add(iCard.build(context));
    }
    
    
    
    
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
                  children:
                    cards,
                  //BURAYA InstructorCard() şeklinde constructorlar gelmesi lazım
              ),
            ],
          ),
        )
    );
  }
}




class InstructorCard extends StatelessWidget{ //Online attribute deleted add it later if needed
  final int id;
  final String name;
  final double responsive;
  final double effective;
  final double overall;
  final String profession;
  final String location;
  final String picture;
  InstructorCard(this.id, this.name,this.responsive,this.effective,this.overall,this.location, this.profession,this.picture);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrainerProfilePage(this.id),
              )
          );},
        child: Stack(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.only(right: 16.0),
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "$picture")
                          )
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    new Text("$name",style: TextStyle(fontSize: 20),),
                    new Text("$profession"+" Instructor",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                    Row(
                      children: <Widget>[
                        InstructorDetail(Icons.message, "$responsive"),
                        InstructorDetail(Icons.event_available, '$effective'),
                        InstructorDetail(Icons.tag_faces, '$overall')
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    new Icon(Icons.location_city),
                    new Text('$location')
                  ],
                )
              ],
            )

            ),
            ),]
          ),
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
      avatar: Icon(iconData, size: 25.0, color: Colors.purple,),
    );
  }
}