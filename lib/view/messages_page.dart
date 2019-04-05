import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';
import 'package:gymnopolis/view/Page.dart';

class MessagesPage extends StatefulWidget with Page{
  static String tag = 'login-page'; //tag for router
  @override
  MessagesPageState createState() => MessagesPageState();

  List<Widget> topBar(BuildContext context){
    return null;
  }
}

class MessagesPageState extends State<MessagesPage> {

  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );

  }
}