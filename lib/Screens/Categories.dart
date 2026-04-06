import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("WELCOME to categories", style: TextStyle(fontSize: 30,color: Colors.white)),
      ),
    );
  }
}
