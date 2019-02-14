import 'package:flutter/material.dart';
/**
 * test all commpoment :
 * 从0开始写一个基于Flutter的开源中国客户端（4）——Flutter布局基础 - 掘金
 *
 * */

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
*/ /*
  width: 100.0,
  height: 100.0,//width,height不设定的话，Container会wrap child,
*/ /*
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
*/ /*
  width: 100.0,
  height: 100.0,//width,height不设定的话，Container会wrap child,
*/ /*

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
          /*  body: AspectRatio(aspectRatio: 16.0/4.0,//宽高比，16占满宽度，
   child: new Container(
     color:Colors.red,

   ),
   )*/
          //6.ConstrainedBox commponent :用于给组件加上强约束，
/*          body: ConstrainedBox(
              constraints:
                  const BoxConstraints.expand(width: 50.0, height: 50.0),
              child: Container(
                color: Colors.red,
                width: 200.0, //将被上边50所约束
                height: 200.0,
              ))),*/

          //7.IntrinsicWidth & IntrinsicHeight
          /*  这两个组件的作用是将他们的子组件调整到组件本身的宽度/高度。
        这个类是非常有用的，例如，当宽度/高度没有任何限制时，你会希望子组件按更合理的宽度/高度显示而不是无限的扩展*/

          //8.LimitedBox组件LimitedBox是一个当其自身不受约束时才限制其大小的容器。
          //如果这个组件的最大宽度是没有约束，那么它的宽度就限制在maxWidth?。类似地，如果这个组件的最大高度没有约束，那么它的高度就限制在maxHeight?。Offstage组件

          //todo
          /*  body: LimitedBox(
              maxWidth: 100.0,
             maxHeight: 100.0,//不能为null
              child: Container(
                color: Colors.red,
                width: 20.0, //不被上边50所约束，按这个来
                height: 20.0,
              ))),
*/

          //9 ，Offstage
          //hide or show its' own Widget

          /*     body: Offstage(
    offstage: false,//true:hide ,false showing,true隐藏，反之显示
    child: Text('test OffsetSet'),
    ),*/

          //10,OverflowBox & SizedOverflowBox
          //OverflowBox组件它给它的子组件带来不同的约束，而不是从它的父组件中得到，可能允许子组件溢出到父组件中。
          //SizedOverflowBox组件是一个指定大小的组件，它的约束会传递给子组件，子组件可能溢出。

/*        body: Offstage(
          offstage: false,
          child: OverflowBox(//会居中，
            maxWidth: 150.0,//这里受到这个ui  widget尺寸控制，若无，受下边child的尺寸控制
            maxHeight: 50.0,

            child: Container(
              color: Colors.red,
              width: 100.0,
              height: 200.0,
            ),
          ),


        //todo later to try
          //  child:SizedOverflowBox(size: 100,Alignment.center,child: Container(null,alignment: CrossAxisAlignment.center,),)
        ),*/

          //sizebox test
        /*  body: SizedBox(
            width: 400.0,
            height: 220.0,//这里控制下边child ,width，height ,
            child: Container(
              color: Colors.orange,
              width: 600.0,
              height: 700.0,
            ),
          ),*/



        ));
  }
}

//test git hub
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
