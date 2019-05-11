import 'Exercise.dart';
import 'ExerciseLog.dart';
import 'InstructorModels/Trainee.dart';

class DayLog {

  final String name = "Day 1";
  List<ExerciseLog> exerciseLog;


  DayLog(){
    exerciseLog = allLogs();
  }


  static List<ExerciseLog> allLogs(){
    List<ExerciseLog> temp = List<ExerciseLog>();

    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    temp.add(ExerciseLog());
    return temp;
  }

}
