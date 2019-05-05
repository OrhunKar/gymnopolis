import 'package:gymnopolis/model/InstructorModels/Trainer.dart';

class Service {
  int id;
  String name;
  String description;
  double rating;
  double cost;
  Service(this.id,this.name,  this.description, this.rating, this.cost);

  static List<Service> canServices()
  {
    var list = new List<Service>();

    list.add(new Service(1,"Begginer Fitness",  "collabration denemesi",  8,  900));
    list.add(new Service(2,"Intermediate Fitness",  "afgdgdfhgfh",  5,  50));
    list.add(new Service(3,"Calistenichs Begginer",  "hdfhgjbnbnbnb",  6,  70));
    list.add(new Service(4,"Street Workout",  "sdgfdgjhkghjdsdsfsdfdfs",  9,  90));

    return list;
  }

}