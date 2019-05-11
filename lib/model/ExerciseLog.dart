import 'Exercise.dart';
import 'InstructorModels/Trainee.dart';
import 'SetResult.dart';

class ExerciseLog{

  final Trainee _trainee;
  final Exercise _exercise;
  int set;

  List<SetResult> logs;

  ExerciseLog(this._trainee, this._exercise, this.logs){
    set = _exercise.set;
  }

}

