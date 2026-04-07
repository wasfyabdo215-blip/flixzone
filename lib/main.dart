import 'package:flixzone/Screens/splash.dart';
import 'package:flixzone/provider/UserProvide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;
import 'package:firebase_core/firebase_core.dart';



void main() async{
  runApp(
    pro.ChangeNotifierProvider(
      create: (context) => Userprovide(),
      child: const MyApp(),
    ),);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
