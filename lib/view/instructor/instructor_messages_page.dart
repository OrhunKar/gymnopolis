import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:gymnopolis/view/instructor/messagesPages/private_messages_page.dart';

final List<Trainee> _trainees = Trainee.allTrainees();

class InstructorsMessagesPage extends StatefulWidget with Page{
  static String tag = 'instructor-messages-page';

  List<Widget> topBar(BuildContext context){
    return null;
  }

  createState() {
    return InstructorsMessagesPageState();
  }
}

@override
class InstructorsMessagesPageState extends State<InstructorsMessagesPage> {
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _trainees.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateMessagesPage(_trainees[index].name)));
            },
          child: new ListTile(
            title : new Text(_trainees[index].name),
            subtitle: new Text("PlaceHolder Last Message"),
            trailing: new Text("Place Holder Date 08/12/18"),
            //onTap: ,
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}



