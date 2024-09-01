import 'package:flutter/material.dart';
import 'package:news_project/data/model/catagory_model.dart';
import 'category_tab.dart';
import 'drawer_widget.dart';
import 'news_ui.dart';

class Home_Screen extends StatefulWidget 
{
  static const String route_Named = "Home";

  Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: const BoxDecoration
      (
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/pattern.png"))),
      child: Scaffold
      (
        backgroundColor: Colors.transparent,
        drawer: Drawer_Widget
        (
          onClick: onDrawerClicked,
        ),
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
            size: 30
          ),

          backgroundColor: Colors.green,
          title: const Text
          (
            "News App",
            style: TextStyle
            (
              fontSize: 30, 
              color: Colors.white, 
              fontWeight: FontWeight.w300
            ),
          ),
          centerTitle: true,
        ),

        body: catagoryModel == null
            ? Category_Tab(onClick: onCategorySelected)
            : NewsUi
            (
              id: catagoryModel!.id,
            ),
      ),
    );
  }

  Catagory_Model? catagoryModel;

  onDrawerClicked(id) 
  {
    if (id == Drawer_Widget.CATEGORY_ID) 
    {
      catagoryModel = null;
      Navigator.pop(context);
    } else if (id == Drawer_Widget.SETTINGS_ID) {}
    setState(() {});
  }

  onCategorySelected(cat) 
  {
    catagoryModel = cat;
    setState(() {});
  }
}