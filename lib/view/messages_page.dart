import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';

class MessagesPage extends StatefulWidget {
  static String tag = 'login-page'; //tag for router
  @override
  MessagesPageState createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {

  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );

  }
}