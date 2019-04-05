import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';

class Workout {

  String name;
  String instructorName;

  Workout(this.name, this.instructorName);


  List<Day> allWorkouts()
  {
    var list = new List<Day>();

    list.add(new Day(name: "Chest", exerciseList: exampleExercises()));
    list.add(new Day(name: "Back", exerciseList: exampleExercises()));
    list.add(new Day(name: "Legs", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));
    list.add(new Day(name: "Shoulder", exerciseList: allExercises()));

    return list;
  }

  static List<Exercise> exampleExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));
    list.add(new Exercise(name: "French Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));
    list.add(new Exercise(name: "Dumbell Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));
    list.add(new Exercise(name: "Romanian Deadlift", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));

    return list;
  }

  static List<Exercise> allExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));

    return list;
  }
}