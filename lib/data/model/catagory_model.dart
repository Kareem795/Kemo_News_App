import 'dart:ui';
import 'package:flutter/material.dart';

class Catagory_Model{
  String id;
  String name;
  String image;
  Color color;

  Catagory_Model({
    required this.id,
    required this.name,
    required this.image,
    required this.color
  });

  static List<Catagory_Model> getCatagories(){
   return [
     Catagory_Model(
         id: "business",
         name: "Business",
         image: "assets/bussines.png",
         color: Colors.greenAccent
     ),
     Catagory_Model(
         id: "sports",
         name: "Sports",
         image: "assets/sports.png",
         color: Colors.red
     ),
    Catagory_Model(
        id: "entertainment",
        name: "Entertainment",
        image: "assets/environment.png",
        color: Colors.green
    ),
    Catagory_Model(
        id: "general",
        name: "General",
        image: "assets/Politics.png",
        color: Colors.yellowAccent
    ),
    Catagory_Model(
        id: "health",
        name: "Health",
        image: "assets/health.png",
        color: Colors.pink
    ),
    Catagory_Model(
        id: "technology",
        name: "Technology",
        image: "assets/science.png",
        color: Colors.blue
    ),
   ];
  }
}