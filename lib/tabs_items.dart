import 'package:flutter/material.dart';
import 'package:kemo_news_app/data/model/Articles_Response.dart';

class Tabs_Items extends StatelessWidget 
{
  Source source;
  bool is_selected;

  Tabs_Items({super.key, required this.source, required this.is_selected});

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      padding: EdgeInsets.symmetric
      (
        horizontal: 14, 
        vertical: 4,
      ),

      decoration: BoxDecoration
      (
        color: is_selected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green)
      ),

      child: Text
      (
        source.name ?? "",
        style: TextStyle
        (
          fontSize: 18,
          fontWeight: is_selected ? FontWeight.bold : FontWeight.normal,
          color: is_selected ? Colors.white : Colors.green,
        ),
      )
    );
  }
}
