import 'package:flutter/material.dart';
import 'package:kemo_news_app/home.dart';

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
        Home_Screen.route_name: (context) => Home_Screen(),
        // Add other routes here.
        // Example:
        // '/about': (context) => AboutScreen(),
      },
      initialRoute: Home_Screen.route_name,
      debugShowCheckedModeBanner: false,
    );
  }
}
