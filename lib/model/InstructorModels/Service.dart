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

    list.add(new Service(1,"Begginer Fitness",  "ATHLEAN XERO is an intense all out bodyweight assault, requiring absolutely no equipment. You literally need your own body and that’s it, making it possible to perform these workouts any where at any time. From dorm rooms to hotel rooms, military barracks to the most desolate surroundings or ill equipped gym…XERO leaves behind the machines, and the excuses! With ATHLEAN XERO, you are the machines! 3…2…1…XERO, the wait is over. The revolution in bodyweight strength training has arrived!",  8,  900));
    list.add(new Service(2,"Intermediate Fitness",  "afgdgdfhgfh",  5,  50));
    list.add(new Service(3,"Calistenichs Begginer",  "hdfhgjbnbnbnb",  6,  70));
    list.add(new Service(4,"Street Workout",  "sdgfdgjhkghjdsdsfsdfdfs",  9,  90));

    return list;
  }

}