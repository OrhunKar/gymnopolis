import 'package:flutter/material.dart';

abstract class Page{
  List<Widget> topBar(BuildContext context){
    return null;
  }

  FloatingActionButton floatingButton(BuildContext context){
    return null;
  }

}