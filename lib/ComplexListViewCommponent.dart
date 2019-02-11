import 'package:flutter/material.dart';
//complex listview ，分割线加入,模拟器好像有bug,可能看不太明显，不是每个item下都有divider,真机待测，todo

void main() {
  List<Widget> items = List();
  for (var i = 0; i < 20; i++) {
    var text = Text("List item $i");
   // items.add(text);//取消，否则多加了，
    //padding 也是一个widget,是一个有内边距的容器，可以装其他widget，这里装了text
    items.add(new Padding(
      padding: const EdgeInsets.all(15.0),
      //padding容器中装的是Text组件
      child: text,
    ));
  }

  runApp(MaterialApp(
    title: "Test list",
    home: Scaffold(
        appBar: AppBar(
          title: Text("test complex listview"),
        ),
        body: new Center(
            //another method :让listview带分割线等
            // build是ListView提供的静态方法，用于创建ListView
            child: ListView.builder(
          // itemCount是ListView的item个数，这里之所以是items.length * 2是因为将分割线也算进去了
          //分割线也是itemCount ,也是widget?todo
          itemCount: items.length * 2,
          itemBuilder: (context, index) {
            //如果index为奇数，则返回分割线（widght）
            if (index.isOdd) {
              return Divider(height: 1.0);
            }
            // if index为偶数，为了根据下标去取item中的元素，需要对index做取整 todo why？
            print("index is$index");
            index = index ~/ 2;//means,~/做取整运算
            print("index ~/2 is$index");
            return items[index];
          },
        ))),
  ));
}
