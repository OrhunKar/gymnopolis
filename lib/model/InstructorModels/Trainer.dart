
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Certificates.dart';

import 'Trainee.dart';

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
  final List<Trainee> students;


  Trainer(this.id, this.picture, this.fullname, this.responsive_rating, this.effective_rating,this.overall_rating,
      this.bio,this.location,this.profession, this.age, this.certificates,this.services,this.students);


  static List<Trainer> allTrainers()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://www.tiredofmydayjob.com/wp-content/uploads/2016/07/Jeff-Cavaliere-Profile.png", "Jeff Cavaliere",  8,  7,6,  "Jeff Cavaliere MSPT, CSCS served as both the Head Physical Therapist and Assistant Strength Coach for the New York Mets during the National League East Championship 2006, 2007 and 2008 seasons and coached some of the game’s most accomplished players including future hall of fame pitchers Tom Glavine and Pedro Martinez, and perennial all-stars Carlos Delgado, Carlos Beltran, David Wright, Jose Reyes, and Billy Wagner to name just a few. He is a Certified Strength and Conditioning Specialist by the National Strength and Conditioning Association (NSCA).","New York","Fitness",32,Certificates.certificate1(),Service.jeffcavaliere(),Trainee.allTrainees()));
    list.add(new Trainer(2, "https://i.hizliresim.com/RrdXW1.jpg", "Mike Tyson",  7, 9,10,  "He is a former undisputed heavyweight champion of the world and holds the record as the youngest boxer to win the WBC, WBA and IBF heavyweight titles at 20 years, 4 months, and 22 days old. ","New York","Boxing",24,Certificates.boxing(),Service.mikeetyson(),Trainee.allTrainees()));
    list.add(new Trainer(3, "https://i.hizliresim.com/v6OoOv.jpg", "Greg O'Gallager",  8,5,4,  "In just the last 5 years, I’ve created a massive fitness influence and I have positioned myself as one of the major fitness authorities online, all by the age of 24. Kinobody is about transforming your physique and living the life of your dreams. Then, Fitness essentially becomes a metaphor for life! When you can master training and nutrition to build an amazing body and become stronger and leaner than you could ever imagine, confidence and self belief goes through the roof.","Vancouver","Fitness",25,Certificates.certificate1(),Service.greg(),Trainee.allTrainees() ));

    return list;
  }

}