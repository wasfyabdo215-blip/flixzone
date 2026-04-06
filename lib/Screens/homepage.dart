import 'package:flutter/material.dart';
import 'package:flixzone/Screens/homescreen.dart';
import 'package:flixzone/Screens/Categories.dart';
import 'package:flixzone/Screens/profile.dart';



class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex=0;

  List<Widget> screens=[
    Homescreen(),
    Categories(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

          ]) ,

    );
  }
}
