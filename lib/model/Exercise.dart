import 'package:flutter/material.dart';

class Exercise {
  final String name;
  int minRep;
  int maxRep;
  int minRPE;
  int maxRPE;
  int set;
  String image;
  var equipment;

  Exercise({this.name, this.minRep, this.maxRep, this.minRPE, this.maxRPE,
      this.set, this.image});

  Exercise.fromExercise(Exercise another): name = another.name, image = another.image;



  String subtitle() {
    if(minRep == maxRep && minRPE != maxRPE) {
      return "$set Set x $minRep reps RPE: $minRPE/$maxRPE";
    }
    else if(minRep != maxRep && minRPE == maxRPE){
      return "$set Set x $minRep-$maxRep reps RPE: $minRPE";
    }

   else if (minRep == maxRep && minRPE == maxRPE)  {
      return "$set Set x $minRep reps RPE: $minRPE";
    }
    else{
      return "$set Set x $minRep-$maxRep reps RPE: $minRPE/$maxRPE";
    }
  }
}


