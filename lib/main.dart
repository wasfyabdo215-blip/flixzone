import 'package:flixzone/Screens/splash.dart';
import 'package:flixzone/provider/UserProvide.dart';
import 'package:flutter/material.dart';
//import 'package:provider/UserProvide.dart';
import 'package:provider/provider.dart' as pro;



void main(){
  runApp(
    // 3. بنلف التطبيق بـ ChangeNotifierProvider من المكتبة (pro)
    pro.ChangeNotifierProvider(
      create: (context) => Userprovide(), // هنا بنادي الكلاس بتاعك أنت
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
