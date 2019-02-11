import 'package:flutter/material.dart';
//simple listview ，分割线都没有


void main(){
  List<Widget> items=List();
  for(var i=0;i<20;i++)
    {
      items.add(Text("List item $i"));
    }

    runApp(MaterialApp(title:"Test list",
        home:Scaffold(
          appBar: AppBar(
            title: Text("test listview"),
          ),
          body: new Center(
            child: ListView(
              children: items,
            ),
          ),
        )
    ),
  );
}