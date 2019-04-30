import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:gymnopolis/model/Exercise.dart';

class ExerciseInfoPage extends StatefulWidget {
  static String tag = 'exerciseinfo-page';

  Exercise exercise;

  ExerciseInfoPage(this.exercise);

  @override
  ExerciseInfoPageState createState() {
    return ExerciseInfoPageState();
  }


}

class ExerciseInfoPageState extends State<ExerciseInfoPage> {
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.exercise.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                context: context,
                source: widget.exercise.video,
                quality: YoutubeQuality.HD,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("The Bench Press is a full body, compound exercise. It works your chest, shoulders and triceps most. It's the most effective exercise to gain upper-body strength and muscle mass because it's the upper-body exercise you'll lift most weight on (more than Overhead Press). The bigger your bench, the bigger your chest."), //List displayed here
              ),

            ],
          ),
        ));
  }
}

