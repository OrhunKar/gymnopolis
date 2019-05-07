import 'package:flutter/material.dart';
import 'package:gymnopolis/view/Page.dart';

import 'package:photo_view/photo_view.dart';

class NutritionPage extends StatelessWidget with Page{
  @override
  Widget build(BuildContext context) {

      return Container(
          color: Colors.white,
          child: PhotoView(
          imageProvider: AssetImage("assets/beslenme.png"),
          )
        );
  }

  List<Widget> topBar(BuildContext context){
    return null;
  }
}
