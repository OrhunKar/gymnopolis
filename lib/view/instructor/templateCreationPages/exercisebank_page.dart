
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';

class ExerciseBankPage extends StatefulWidget {
  static List<Exercise> selectedExercises = List<Exercise>();

  createState() {
    return ExerciseBankState();
  }
}

class ExerciseBankState extends State<ExerciseBankPage> {
  final bank = Workout.exampleExercises();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Exercise Bank"),
          actions: <Widget>[]
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.check)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: bank.length,
        itemBuilder: (context, index) {
          return SelectableWidget(
            SelectableWidgetViewModel(
              Exercise(base: bank[index]),
              isSelected: false
            ));
        }));
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.viewModel.isSelected = !widget.viewModel.isSelected;
          if (widget.viewModel.isSelected)
            ExerciseBankPage.selectedExercises.add(widget.viewModel._exercise);
          else
            ExerciseBankPage.selectedExercises.remove(widget.viewModel._exercise);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Center(
          child: Card(
            color: widget.viewModel.isSelected ? Colors.green : Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20.0,
                  child: Image.asset(widget.viewModel._exercise.base.image)),
              title : Text(widget.viewModel._exercise.base.name, style: TextStyle(fontSize: 22.0)),
            )))));
  }
}

class SelectableWidgetViewModel {
  bool isSelected;
  Exercise _exercise;

  SelectableWidgetViewModel(this._exercise, {this.isSelected = false});
}