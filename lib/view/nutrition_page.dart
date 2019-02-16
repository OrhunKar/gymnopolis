import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/control/placeholder_widget.dart';
import 'package:zoomable_image/zoomable_image.dart';
class NutritionPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ZoomableImage(
          new AssetImage('assets/beslenme.png'),
          placeholder: const Center(child: const CircularProgressIndicator()),
          backgroundColor: Colors.transparent),
    );
  }
}