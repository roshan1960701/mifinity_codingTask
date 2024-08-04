// To parse this JSON data, do
//
//     final dashBoardDataModel = dashBoardDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DashBoardDataModel dashBoardDataModelFromJson(String str) => DashBoardDataModel.fromJson(json.decode(str));

String dashBoardDataModelToJson(DashBoardDataModel data) => json.encode(data.toJson());

class DashBoardDataModel {
  List<Banner> banners;
  List<Banner> productionHouse;
  List<MoviesCollection> moviesCollection;

  DashBoardDataModel({
    required this.banners,
    required this.productionHouse,
    required this.moviesCollection,
  });

  factory DashBoardDataModel.fromJson(Map<String, dynamic> json) => DashBoardDataModel(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    productionHouse: List<Banner>.from(json["productionHouse"].map((x) => Banner.fromJson(x))),
    moviesCollection: List<MoviesCollection>.from(json["moviesCollection"].map((x) => MoviesCollection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "productionHouse": List<dynamic>.from(productionHouse.map((x) => x.toJson())),
    "moviesCollection": List<dynamic>.from(moviesCollection.map((x) => x.toJson())),
  };
}

class Banner {
  String image;

  Banner({
    required this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class MoviesCollection {
  String category;
  List<Movie> movies;

  MoviesCollection({
    required this.category,
    required this.movies,
  });

  factory MoviesCollection.fromJson(Map<String, dynamic> json) => MoviesCollection(
    category: json["category"],
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}

class Movie {
  String title;
  String image;
  String genre;

  Movie({
    required this.title,
    required this.image,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["title"],
    image: json["image"],
    genre: json["genre"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "genre": genre,
  };
}
