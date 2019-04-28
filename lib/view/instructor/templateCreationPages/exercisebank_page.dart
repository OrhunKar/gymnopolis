
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/ExerciseBank.dart';



class ExerciseBankPage extends StatefulWidget {

  static List<Exercise> selectedExercises = List<Exercise>();


  ExerciseBankPage();

  createState() {
    return ExerciseBankState();
  }
}

class ExerciseBankState extends State<ExerciseBankPage>{

  var bank = ExerciseBank.exampleExercises();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Exercise Bank"),
          actions: <Widget>[

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
        itemCount: bank.length,
        itemBuilder: (context, index) {
          return new SelectableWidget(
            new SelectableWidgetViewModel(
              bank[index],
              isSelected: false)
          );
        },
      ),
    );
  }

}


class SelectableWidget extends StatefulWidget {
  final SelectableWidgetViewModel viewModel;

  SelectableWidget(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return SelectableWidgetState();
  }
}

class SelectableWidgetState extends State<SelectableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Padding padding;

    if (widget.viewModel.isSelected) {
      padding = new Padding(
          padding: const EdgeInsets.all(3.0),
          child: Center(
            child: Card(
              color: Colors.green,
              child: new ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20.0,
                    child: Image.asset('assets/benchpress3.png')),
                title : new Text(widget.viewModel._exercise.name, style: new TextStyle(fontSize: 22.0)),
              ),
            ),
          ),
        );
    } else {
      padding = new Padding(
          padding: const EdgeInsets.all(3.0),
          child: Center(
            child: Card(
              color: Colors.white,
              child: new ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20.0,
                    child: Image.asset('assets/benchpress3.png')),
                title : new Text(widget.viewModel._exercise.name, style: new TextStyle(fontSize: 22.0)),
              ),
            ),
          ),
        );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.viewModel.isSelected = !widget.viewModel.isSelected;
          if(widget.viewModel.isSelected == true){
            ExerciseBankPage.selectedExercises.add(widget.viewModel._exercise);
          }
          else{
            ExerciseBankPage.selectedExercises.remove(widget.viewModel._exercise);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: padding,
      ),
    );
  }
}

class SelectableWidgetViewModel {
  bool isSelected;
  Exercise _exercise;

  SelectableWidgetViewModel(this._exercise, {this.isSelected = false});
}