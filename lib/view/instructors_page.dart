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
                    new Text("Ayca_22"),
                  ],

                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    InstructorDetail(Icons.account_balance_wallet, '70\$ month'),
                    InstructorDetail(Icons.star, '4.4')
                  ],

                )
              ],
            ),
          ),
        ),
      ],
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