import 'package:flutter/material.dart';
import 'package:news_project/UI/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home_Screen.route_Named: (context) => Home_Screen(),
        
      },
      initialRoute: Home_Screen.route_Named,
      debugShowCheckedModeBanner: false,
    );
  }
}
