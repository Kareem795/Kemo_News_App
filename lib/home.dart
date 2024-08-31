import 'package:flutter/material.dart';
import 'package:kemo_news_app/API_Manager.dart';
import 'package:kemo_news_app/data/model/news_ui.dart';

class Home_Screen extends StatelessWidget 
{
  static const String route_name = "Home_screen";

  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/pattern.png"))
      ),

      child: Scaffold
      (
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        
        appBar: AppBar
        (
          actions: 
          [
            IconButton
            (
              onPressed: () {}, 
              icon: Icon(Icons.search)
            )
          ],

          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.only
            (
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
          ),

          iconTheme: IconThemeData
          (
            color: Colors.white,
            size: 30,
          ),

          backgroundColor: Colors.green,
          title: Text
          (
            "News App",
            style: TextStyle
            (
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
            )
          ),
          centerTitle: true,
        ),

        body: News_UI(),
      ),
    );
  }
}
