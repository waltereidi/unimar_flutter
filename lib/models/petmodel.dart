// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

import 'package:unimar_sab_19/models/userpetmodel.dart';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  List<Pet> pets;

  Pets({required this.pets});

  factory Pets.fromJson(Map<String, dynamic> json) =>
      Pets(pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
  };
}

class Pet {
  String id;
  String name;
  String? breed;
  String? gender;
  String? category;
  int age;
  int weight;
  String color;
  String? story;
  List<String> images;
  UserPetApp user;
  bool isVerified;
  bool available;
  DateTime createdAt;
  DateTime updatedAt;

  Pet({
    required this.id,
    required this.name,
    this.breed,
    this.gender,
    this.category,
    required this.age,
    required this.weight,
    required this.color,
    this.story,
    required this.images,
    required this.user,
    required this.isVerified,
    required this.available,
    required this.createdAt,
    required this.updatedAt,
   
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["_id"],
    name: json["name"],
    breed: json["breed"],
    gender: json["gender"],
    category: json["category"],
    age: json["age"],
    weight: json["weight"],
    color: json["color"],
    story: json["story"],
    images: List<String>.from(json["images"].map((x) => x)),
    user: UserPetApp.fromJson(json["user"]),
    isVerified: json["isVerified"],
    available: json["available"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "breed": breed,
    "gender": gender,
    "category": category,
    "age": age,
    "weight": weight,
    "color": color,
    "story": story,
    "images": List<dynamic>.from(images.map((x) => x)),
    "user": user.toJson(),
    "isVerified": isVerified,
    "available": available,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  
  };
}
