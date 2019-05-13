
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/exerciseinfo_page.dart';
import 'package:gymnopolis/view/trainee/workout_assistant.dart';

class DayPage extends StatefulWidget {
  static String tag = 'day-page';

  final CollectionReference reference;

  DayPage(this.reference);

  @override
  DayPageState createState() {
    return new DayPageState();
  }
}

class DayPageState extends State<DayPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.reference.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting)
          return new Text('Loading...');

        List<Exercise> exercises = snapshot.data.documents.map((DocumentSnapshot document) =>
          Exercise(
            base: Workout.exampleExercises()[document.data['id'] - 1],
            set: document.data['set'],
            minRep: document.data['minREP'],
            maxRep: document.data['maxREP'],
            minRPE: document.data['minRPE'],
            maxRPE: document.data['maxRPE']
          )).toList();
        
        return Scaffold(
          floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) =>
              WorkoutAssistantPage(widget.reference.id, exercises))
          ),
          child: Icon(Icons.fitness_center)),
          appBar: AppBar(title: Text('Day ${widget.reference.id}')),
          body: ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: exercises.map((Exercise exercise) =>
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExerciseInfoPage(exercise.base)));
                },
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Center(
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20.0,
                          child: Image.asset(exercise.base.image)
                        ),
                        title : Text(exercise.base.name, style: new TextStyle(fontSize: 22.0)),
                        subtitle: Text(exercise.subtitle())
                      )))))
            ).toList()
          ));
      });
  }
}