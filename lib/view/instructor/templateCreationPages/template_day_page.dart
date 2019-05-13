
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/exercisebank_page.dart';

class TemplateDayPage extends StatefulWidget {
  static String tag = 'workout-page';

  final Day day;

  TemplateDayPage(this.day);

  createState() {
    return TemplateDayState();
  }
}

class TemplateDayState extends State<TemplateDayPage> {
  @override
  Widget build(BuildContext context) {
    var items = widget.day.exerciseList;
    items = new List<Exercise>.from(items)..addAll(ExerciseBankPage.selectedExercises);
    ExerciseBankPage.selectedExercises = new List<Exercise>();

    widget.day.exerciseList = items;
    void _showDialog2(Exercise ex) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(ex.name),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      ex.set = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 3",
                      labelText: 'Number of sets per exercise',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      ex.minRep = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 6",
                      labelText: 'Minimum rep count',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      ex.maxRep = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "eg. 12",
                      labelText: 'Maximum rep count',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      ex.minRPE = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "integer between 1-10",
                      labelText: 'Min RPE',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      ex.maxRPE = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: "integer between 1-10",
                      labelText: 'Max RPE',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseBankPage()));
            });
          })]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.check)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: widget.day.exerciseList.length,
        itemBuilder: (context, index) {
          final item = widget.day.exerciseList[index].name;

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
              setState(() {
                widget.day.exerciseList.removeAt(index);
              });

              // Then show a snackbar!
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.red),

            child: Card(
              child: GestureDetector(
                onLongPress: (){
                  _showDialog2(widget.day.exerciseList[index]);
                },
                child: new ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      child: Image.asset(widget.day.exerciseList[index].base.image)),
                  title : new Text(widget.day.exerciseList[index].base.name,
                    style: new TextStyle(fontSize: 22.0)),
                  subtitle: new Text(widget.day.exerciseList[index].subtitle()),

                ),
              ),
            ),
          );
        },
      ),
    );
  }
}