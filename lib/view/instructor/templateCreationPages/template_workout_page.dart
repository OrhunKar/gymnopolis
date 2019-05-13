
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/template_day_page.dart';

class TemplateWorkoutPage extends StatefulWidget {
  static String tag = 'workout-page';

  final String name;
  final Workout workout;

  TemplateWorkoutPage(this.name, this.workout);

  createState() {
    return TemplateWorkoutState();
  }
}

class TemplateWorkoutState extends State<TemplateWorkoutPage> {
  final workoutPlans = Firestore.instance.collection('workout_plans');
  int day = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('workout_plans')
        .where('name', isEqualTo: widget.name).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting)
          return new Text('Loading...');
        
        var workoutPlan = snapshot.data.documents[0];
        var days = workoutPlan.data['days'];
        widget.workout.days.addAll(List.generate(days, (i) => Day('Day $i', List<Exercise>())));

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.info), onPressed: () {}),
              new IconButton(icon: new Icon(Icons.add), onPressed: () {
                setState(() {
                  widget.workout.days.add(new Day("Day $day", new List<Exercise>()));
                  day++;
                });
              })]),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var workoutPlan = await workoutPlans.add({
                'trainer': Engine.user,
                'trainee': 'Umut',
                'days': widget.workout.days.where((day) => day.exerciseList.isNotEmpty).length
              });
              widget.workout.days.asMap().forEach((index, day) {
                var workoutDay = workoutPlan.collection((index + 1).toString());
                day.exerciseList.forEach((exercise) => workoutDay.add({
                  'id': Workout.exampleExercises().indexOf(exercise.base) + 1,
                  'set': exercise.set,
                  'minREP': exercise.minRep,
                  'maxREP': exercise.maxRep,
                  'minRPE': exercise.minRPE,
                  'maxRPE': exercise.maxRPE
                }));
              });
              Navigator.pop(context);
            },
            child: Icon(Icons.check)
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: ListView.builder(
            itemCount: widget.workout.days.length,
            itemBuilder: (context, index) {
              final day = widget.workout.days[index];

              return ListTile(
                title: Text(day.name),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateDayPage(day)));
                });
            }));
    });
  }
}