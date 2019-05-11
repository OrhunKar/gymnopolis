import 'Exercise.dart';
import 'InstructorModels/Trainee.dart';
import 'SetResult.dart';

class ExerciseLog{

  Trainee trainee;
  Exercise exercise;
  int set;

  List<SetResult> logs;

  ExerciseLog({this.trainee, this.exercise, this.logs});
}

