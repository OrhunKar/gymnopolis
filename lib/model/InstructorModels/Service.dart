import 'package:gymnopolis/model/InstructorModels/Trainer.dart';

class Service {
  int id;
  List<Trainer> trainers;
  String description;
  double rating;
  double cost;
  Service(this.id, this.trainers, this.description, this.rating, this.cost);
  static List<Service> allServices()
  {
    var list = new List<Service>();

    list.add(new Service(1,Trainer.collab1(), "collabration denemesi",  8,  900));

    return list;
  }

}