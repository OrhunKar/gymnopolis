import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/template_day_page.dart';
import 'dart:math' as math;

class TemplateWorkoutPage extends StatefulWidget {
  static String tag = 'workout-page';

  final String name;
  final Workout workout;

  static List<Workout> workouts = List<Workout>();

  static List<Day> days = List<Day>();


  TemplateWorkoutPage(this.name, this.workout);

  createState() {
    return TemplateWorkoutState();
  }
}

class TemplateWorkoutState extends State<TemplateWorkoutPage> {

  TemplateWorkoutState();
  int day = 1;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text(widget.name),
          actions: <Widget>[

            new IconButton(icon: new Icon(Icons.info),onPressed:(){
              setState(() {


              });
            } ,),
            new IconButton(icon: new Icon(Icons.add),onPressed:(){
            setState(() {
              widget.workout.days.add(new Day("Day $day", new List<Exercise>()));
              day = day + 1;
            });
            } ,)
          ]
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.check)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: widget.workout.days.length,
        itemBuilder: (context, index) {
          final item = widget.workout.days[index].name;

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
              setState(() {
                widget.workout.days.removeAt(index);
              });

              // Then show a snackbar!
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item deleted")));
            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.redAccent),
            child: ListTile(
              title: Text('$item'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateDayPage(widget.workout.days[index].name,widget.workout.days)));
              },
            ),
          );
        },
      ),
















      /*new ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (BuildContext context, int index){
              return new GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TemplateDayPage('Placeholder'),
                    )
                  );
                },
                child: new ListTile(
                  title : new Text(workouts[index].name),
                  subtitle: new Text(workouts[index].name + " Hoca"),
                  leading: new CircleAvatar(
                    radius: 20.0,
                    child: new Text(index.toString())
                  )
                ),
              ) ;
            },
            padding: new EdgeInsets.symmetric(vertical: 8.0),//body: ,
      )*/
    );
  }

}