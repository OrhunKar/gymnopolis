import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final int minRep;
  final int maxRep;
  final int minRPE;
  final int maxRPE;
  final int set;
  final Image image;
  var equipment;

  Exercise({this.name, this.minRep, this.maxRep, this.minRPE, this.maxRPE,
      this.set, this.image});

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


