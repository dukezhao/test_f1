import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test container',
      home: Scaffold(
        appBar: AppBar(
          title: Text('test container'),
        ),

//1. test Center widget;
/*        body: Center(//center commponent is make sub-widget in it will show as centerally , if you don't give any limitation , the sub-widget will be as large as posiable in Center ,
          child: Text('test center edge '),

        ),*/
//2. test Container widget;
       /* body: Container(
*//*
  width: 100.0,
  height: 100.0,//width,height不设定的话，Container会wrap child,
*//*
//设置外边距为20.0
          margin: const EdgeInsets.all(20.0),

          //设置内边距 ,4个分开设置

          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
          width: 100.0,
          height: 100.0,

          color: Colors.red,
          child: Text(
              'test container'), //显示在左上角//width,height,child同时去掉的话，会撑满整个父容器
        ),*/

//3. test Container widget with align;
        //test another Container ,一Text 在其父类的右底部，


/*        body: Container(
*//*
  width: 100.0,
  height: 100.0,//width,height不设定的话，Container会wrap child,
*//*

          width: 100.0,
          height: 100.0,

          color: Colors.red,
          //在原child外部wrap 一个child 去align
          child:Align(

            child: Text(
                'test container'), //显示在左上角//width,height,child同时去掉的话，会撑满整个父容器
            alignment: Alignment.topLeft,//how to align to the parent ,
          )

        ),*/
//4. text FittedBox

/*body: Container(
  width: 200.0,
  height: 200.0,
  color: Colors.red,
  child: FittedBox(
    child: Text('test fittedBox '),
    fit: BoxFit.fill,//cover 和fitHeight差不多
  ),
),*/

//5.AspectRatio commponent
   body: AspectRatio(aspectRatio: 16.0/4.0,//宽高比，16占满宽度，
   child: new Container(
     color:Colors.red,

   ),
   )
   //6.ConstrainedBox commponent :用于给组件加上强约束，

      ),
    );
  }
}
//FittedBox组件根据fit属性来确定子组件的位置，fit属性是一个BoxFit类型的值，BoxFit是个枚举类，取值有如下几种：
/*
enum BoxFit{
fill,
  contain,
  cover,
  fitWidth,
  fitHeight,
  none,
  scaleDown,

}
*/
