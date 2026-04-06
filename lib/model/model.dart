import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String image;
  final double rating;
  final String description;

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
  });
}