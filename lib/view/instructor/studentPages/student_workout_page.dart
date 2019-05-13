import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/InstructorModels/Template.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/instructor/workoutAddingPages/template_selection_page.dart';

class StudentWorkoutPage extends StatefulWidget{

  static String tag = 'instructor-profile-page';

  final String name;
  final Workout workout;

  StudentWorkoutPage(this.name, this.workout);

  createState() {
    return StudentWorkoutPageState();
  }
}

@override
class StudentWorkoutPageState extends State<StudentWorkoutPage> {

  Widget build(BuildContext context) {
    /*List<Workout> selectedWorkouts = List<Workout>();

    selectedWorkouts.add(widget.workout);

    for (var i = 0; i < TemplateSelectionPage.selectedTemplates.length; i++) {
      selectedWorkouts.add(TemplateSelectionPage.selectedTemplates[i].workout);
    }

    TemplateSelectionPage.selectedTemplates = List<Template>();

    List<Day> currentDays = List<Day>();

    for (var i = 0; i < selectedWorkouts.length; i++) {
      for (var k = 0; k < selectedWorkouts[i].days.length; k++) {
        currentDays.add(selectedWorkouts[i].days[k]);
      }
    }*/

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => TemplateSelectionPage(widget.name)));
        },
        child: Icon(Icons.add)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container() /*ListView.builder(
        itemCount: currentDays.length,
        itemBuilder: (context, index) {
          final item = currentDays[index].name;

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
              setState(() {
                currentDays.removeAt(index);
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
                //Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateSelectionPage()));
              },
            ),
          );
        },*/
    );
  }
}