import 'dart:convert';

import 'package:latihan_uts/model/menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;
  Menus? menus;

//required gaboleh kosong
  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus
      });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toString(),
        menus : json['menus'] != null ? new Menus.fromJson(json['menus']) : null
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
        if (this.menus != null) {
      data['menus'] = this.menus!.toJson();
    }
    return data;
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}