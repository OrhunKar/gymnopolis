
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/exercisebank_page.dart';

class TemplateDayPage extends StatefulWidget {
  static String tag = 'workout-page';

  final CollectionReference reference;
  final Day day;

  TemplateDayPage(this.day, this.reference);

  createState() {
    return TemplateDayState();
  }
}

class TemplateDayState extends State<TemplateDayPage> {
  final changes = List<Exercise>();

  @override
  Widget build(BuildContext context) {
    changes.addAll(ExerciseBankPage.selectedExercises);
    ExerciseBankPage.selectedExercises = new List<Exercise>();

    void _showDialog2(Exercise ex) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(ex.base.name),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.set = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 3",
                      labelText: 'Number of sets per exercise',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.minRep = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 6",
                      labelText: 'Minimum rep count',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.maxRep = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 12",
                      labelText: 'Maximum rep count',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.minRPE = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "integer between 1-10",
                      labelText: 'Min RPE',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.maxRPE = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "integer between 1-10",
                      labelText: 'Max RPE',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ex.rest = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 30",
                      labelText: 'Rest time in seconds',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Confirm"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.day.name),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings), onPressed: () {
            setState(() {
              //_showDialog2("For all exercises");
            });
          }),
          new IconButton(icon: new Icon(Icons.add), onPressed: () {
            setState(() {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExerciseBankPage()));
            });
          })
        ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.check)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.reference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting)
            return Text('Loading...');

          List<Exercise> exercises = snapshot.data.documents.map((
            DocumentSnapshot document) =>
            Exercise(
              base: Workout.exampleExercises()[document.data['id'] - 1],
              set: document.data['set'],
              minRep: document.data['minREP'],
              maxRep: document.data['maxREP'],
              minRPE: document.data['minRPE'],
              maxRPE: document.data['maxRPE']
            )).toList();

          widget.day.exerciseList = exercises;
          widget.day.exerciseList.addAll(changes);

          return ListView.builder(
            itemCount: widget.day.exerciseList.length,
            itemBuilder: (context, index) {
              return Card(
                child: GestureDetector(
                  onLongPress: () {
                    _showDialog2(widget.day.exerciseList[index]);
                  },
                  child: new ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      child: Image.asset(
                        widget.day.exerciseList[index].base.image)),
                    title: new Text(widget.day.exerciseList[index].base.name,
                      style: new TextStyle(fontSize: 22.0)),
                    subtitle: new Text(
                      widget.day.exerciseList[index].subtitle()),

                  ),
                ),
              );
            },
          );
        }));
  }
}
