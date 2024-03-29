
class Exercise {
  Exercise base;
  final String name;
  int minRep;
  int maxRep;
  int minRPE;
  int maxRPE;
  int set;
  int rest;
  String image;
  String video;
  var equipment;

  Exercise({this.base, this.name, this.minRep, this.maxRep, this.minRPE, this.maxRPE,
    this.set, this.rest, this.image, this.video});

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