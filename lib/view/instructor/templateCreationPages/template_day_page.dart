

import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/exercisebank_page.dart';

class TemplateDayPage extends StatefulWidget {
  static String tag = 'workout-page';

  final String name;
  final List<Day> days;

  TemplateDayPage(this.name, this.days);

  //TemplateDayPage.fromTemplateDayPage(TemplateDayPage another): _selectedExercises = another._selectedExercises;

  createState() {
    return TemplateDayState();
  }
}

class TemplateDayState extends State<TemplateDayPage>{



  @override
  Widget build(BuildContext context) {

    Day currentDay = widget.days.firstWhere((test) => test.name == widget.name);
    var items = currentDay.exerciseList;
    items = new List<Exercise>.from(items)..addAll(ExerciseBankPage.selectedExercises);
    ExerciseBankPage.selectedExercises = new List<Exercise>();

    currentDay.exerciseList = items;


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.name),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.add),onPressed:(){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseBankPage()));
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
        itemCount: currentDay.exerciseList.length,
        itemBuilder: (context, index) {
          final item = currentDay.exerciseList[index].name;

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
              setState(() {
                currentDay.exerciseList.removeAt(index);
              });

              // Then show a snackbar!
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }

}