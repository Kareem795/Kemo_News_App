import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kemo_news_app/API_Manager.dart';
import 'package:kemo_news_app/data/model/Articles_Response.dart';
import 'package:kemo_news_app/data/model/Sources_Response.dart';
import 'package:kemo_news_app/tabs_items.dart';

class News_UI extends StatefulWidget 
{
  const News_UI({super.key});

  @override
  State<News_UI> createState() => _News_UIState();
}

class _News_UIState extends State<News_UI> 
{
  int selected_tap_index = 0;
  List<Sources> sources = [];

  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      children: 
      [
        FutureBuilder
        (
          future: ApiManager.getSources(),
          builder: (context, snapshot) 
          {
            if (snapshot.connectionState == ConnectionState.waiting) 
            {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) 
            {
              return Center(child: Text("Something went wrong"));
            }

            sources = snapshot.data?.sources ?? []; 

            // return ListView.builder
            // (
            //   itemBuilder: (context, index)
            //   {
            //     return ListTile
            //      (
            //       title: Text(sources[index].name ?? ""),
            //     );
            //   },
            //   itemCount: sources.length,
            // );

            return Padding
            (
              padding: const EdgeInsets.all(8.0),
              child: Column
              (
                children: 
                [
                  DefaultTabController
                  (
                    length: sources.length,
                    child: TabBar
                    (
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      onTap: (value) 
                      {
                        selected_tap_index = value;
                        setState(() {});
                      },
                      tabs: sources.map
                      (
                        (e) => Tabs_Items
                        (
                          source: e,
                          is_selected: sources.elementAt(selected_tap_index) == e,
                        )
                      ).toList(),
                      
                    )
                  ),

                  FutureBuilder
                  (
                    future: ApiManager.getNewsData(sources[selected_tap_index].id??""),
                    // future: ApiManager.getNewsData("abc-news"),
                    builder: (context, snapshot) 
                    {
                      if (snapshot.connectionState == ConnectionState.waiting) 
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                  
                      if (snapshot.hasError) 
                      {
                        return Center(child: Text("Something went wrong"));
                      }
                  
                      var articles = snapshot.data?.articles ?? [];
                  
                      // return ListView.builder
                        // (
                        //   itemBuilder: (context, index) 
                        //   {
                        //     return Text(articles[index].title ?? "");
                        //   },
                        //   itemCount: articles.length,
                        // ),
                  
                      return ListView.separated
                      (
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) 
                        {
                          return Text(articles[index].title ?? "");
                        },
                        itemCount: articles.length,
                      );
                    },
                  )

                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
