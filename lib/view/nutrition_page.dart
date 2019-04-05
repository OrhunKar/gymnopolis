import 'package:flutter/material.dart';
import 'package:gymnopolis/view/Page.dart';


class NutritionPage extends StatelessWidget with Page{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter PDF Viewer'),
        ),
      ),
    );
  }

  List<Widget> topBar(BuildContext context){
    return null;
  }
}