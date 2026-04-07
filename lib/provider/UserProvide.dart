import 'package:flutter/material.dart';
import '../model/model.dart';

class Userprovide extends ChangeNotifier {
  String? _registeredEmail;
  String? _registeredPassword;
  String? _userName;

  String get userName => _userName ?? "Guest";
  String? get registeredEmail => _registeredEmail;
  String? get registeredPassword => _registeredPassword;

  void registerUser(String name, String email, String password) {
    _userName = name;
    _registeredEmail = email;
    _registeredPassword = password;
    notifyListeners();
  }

  final List<Movie> _favoriteMovies = [];
  List<Movie> get favoriteMovies => _favoriteMovies;

  void toggleFavorite(Movie movie) {
    int index = _favoriteMovies.indexWhere((m) => m.title == movie.title);
    if (index != -1) {
      _favoriteMovies.removeAt(index);
    } else {
      _favoriteMovies.add(movie);
    }
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favoriteMovies.any((m) => m.title == movie.title);
  }
}