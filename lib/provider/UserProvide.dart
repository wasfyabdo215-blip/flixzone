import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class Userprovide extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  User? get user => _user;

  String get userName => _user?.displayName ?? "Guest";


  Future<void> registerUser(String name, String email, String password) async {
    try {

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;

      if (_user != null) {

        await _user!.updateDisplayName(name);


        _firestore.collection('users').doc(_user!.uid).set({
          'uid': _user!.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "حدث خطأ أثناء التسجيل";
    } catch (e) {
      throw "حدث خطأ غير متوقع: $e";
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "فشل تسجيل الدخول";
    }
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

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}