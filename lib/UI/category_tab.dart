import 'package:flutter/cupertino.dart';
import 'package:news_project/data/model/catagory_model.dart';
import 'package:news_project/ui/category_item.dart';

class Category_Tab extends StatelessWidget 
{
  Function onClick;

  Category_Tab({required this.onClick, super.key});

  var catagorys = Catagory_Model.getCatagories();

  @override
  Widget build(BuildContext context) 
  {
    return Padding
    (
      padding: const EdgeInsets.all(18.0),
      child: Column
      (
        children: 
        [
          Text
          (
            "pick your catagory of intersted",
            style: TextStyle(fontSize: 30),
          ),

          SizedBox(height: 12,),

          Expanded
          (
            child: GridView.builder
            (
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),

              itemBuilder: (context, index) 
              {
                return GestureDetector
                (
                  onTap: () 
                  {
                    onClick(catagorys[index]);
                  },

                  child: Category_Item
                  (
                    catagoryModel: catagorys[index],
                    isOdd: index.isOdd,
                  )
                );
              },
              itemCount: catagorys.length,
            ),
          )
        ],
      ),
    );
  }
}