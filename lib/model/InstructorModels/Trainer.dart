
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Certificates.dart';

class Trainer {
  final int id;
  final String picture;
  final String fullname;
  final double responsive_rating;
  final double effective_rating;
  final double overall_rating;

  final String bio;
  final String location;
  final String profession;
  final List<Certificates> certificates;
  final int age;
  final List<Service> services;
  Trainer(this.id, this.picture, this.fullname, this.responsive_rating, this.effective_rating,this.overall_rating,this.bio,this.location,this.profession, this.age, this.certificates,this.services);


  static List<Trainer> allTrainers()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://i.hizliresim.com/RrdXW1.jpg", "Can Avcı",  8,  7,6,  "I was born in etc etc etc df g yes and then I etc etc also known asdg dsaddfgfgfg fsgdgdfgdfg","Ankara","Calisthenics",23,Certificates.certificate1(),Service.canServices()));
    list.add(new Trainer(2, "https://i.hizliresim.com/RrdXW1.jpg", "Umut Ak",  7, 9,10,  "I was born in etc etc etc","İstanbul","Body Building",24,Certificates.certificate1(),Service.canServices()),);
    list.add(new Trainer(3, "https://i.hizliresim.com/RrdXW1.jpg", "Orhun Kar",  8,5,4,  "I was born in etc etc etc","Mersin","Power Lifting",25,Certificates.certificate1(),Service.canServices() ));
    list.add(new Trainer(4, "https://i.hizliresim.com/RrdXW1.jpg", "Alperen Kaya",  4,6,5,  "I was born in etc etc etc","Denizli","Boxing",26,Certificates.certificate1(),Service.canServices()));
    list.add(new Trainer(5, "https://i.hizliresim.com/RrdXW1.jpg", "Burak Gök",  4,5,6,  "I was born in etc etc etc","Malatya","Running",27,Certificates.certificate1(),Service.canServices()));
    return list;
  }

}