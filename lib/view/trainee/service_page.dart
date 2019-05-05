import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/view/Page.dart';

class ServicePage extends StatefulWidget with Page{
  static String tag = 'login-page'; //tag for router
  @override
  ServicePageState createState() => ServicePageState();
  Service service;
  ServicePage(this.service);
  List<Widget> topBar(BuildContext context){
    return null;
  }
}

class ServicePageState extends State<ServicePage> {

  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );

  }
}