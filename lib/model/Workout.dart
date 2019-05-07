import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:flutter/material.dart';
class Workout {

  String name;
  String instructorName;
  List<Day> days;

  Workout(this.name, this.instructorName, this.days);



  static Workout exampleWorkout(){
    return Workout('ExampleWorkoutName', 'PlaceHolderTrainerName', allDays());
  }

  List<Day> allWorkouts()
  {
    var list = new List<Day>();

    list.add(new Day("Ex1", exampleExercises()));
    list.add(new Day("Ex2", exampleExercises()));
    list.add(new Day("Ex3", allExercises()));
    list.add(new Day("Ex4", allExercises()));

    return list;
  }

  static List<Day> allDays()
  {
    var list = new List<Day>();

    list.add(new Day("Chest", exampleExercises()));
    list.add(new Day("Back", exampleExercises()));
    list.add(new Day("Legs", allExercises()));
    list.add(new Day("Shoulder", allExercises()));

    return list;
  }



  static List<Exercise> exampleExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5,image: 'assets/benchpress3.png',video:'9l9guSIjnZY-w'));
    list.add(new Exercise(name: "Push Up", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5,image: 'assets/pushup.png',video:'5eSM88TFzAs-w'));
    list.add(new Exercise(name: "Pull Up", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5,image: 'assets/pullup.png',video:'iUNoLR0pYjY-w'));
    list.add(new Exercise(name: "Dumbell Deadlift", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5,image: 'assets/deadlift (2).png',video:'tghHkZW1KBI-w'));

    return list;
  }

  static List<Exercise> allExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5,image: 'assets/benchpress3.png',video:'9l9guSIjnZY-w'));

    return list;
  }
}