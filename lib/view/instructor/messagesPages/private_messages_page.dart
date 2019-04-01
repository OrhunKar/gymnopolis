import 'package:flutter/material.dart';


class PrivateMessagesPage extends StatefulWidget {
  static String tag = 'private-messages-page';

  final String name;

  PrivateMessagesPage(this.name);

  createState() {
    return PrivateMessagesPageState();
  }
}

@override
class PrivateMessagesPageState extends State<PrivateMessagesPage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.name),
      ),
      body: Container(
        height: 300.0,
        color: Colors.purple,
      )


    );
  }
}