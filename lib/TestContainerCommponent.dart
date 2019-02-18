/**
 * test all commpoment :
 * 从0开始写一个基于Flutter的开源中国客户端（4）——Flutter布局基础 - 掘金
 *
 * */

import 'dart:math' as math;

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

          //11. sizebox test
          /*  body: SizedBox(
            width: 400.0,
            height: 220.0,//这里控制下边child ,width，height ,
            child: Container(
              color: Colors.orange,
              width: 600.0,
              height: 700.0,
            ),
          ),*/
          //12 test Transform用于在绘制子组件前对子组件进行某些变换操作，比如平移、旋转、缩放等。

          //扭曲的矩形，菱形類似
          /*         body: Transform(
              transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Apartment for rent'),
          ),),*/

          //13：包含多個子widget的容器：Row,这里是一个text,一个方块，一个text:'world'

  /*        body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,//center表示:在主轴对齐方式，居中，spaceEvenly 和 spaceAround更居中一些，即text的文字在其控件自身内部再居中一些,
            //mainAxisAlignment表示Row中的子组件在主轴(Row组件主轴表示水平方向，交叉轴表示垂直方向，Column组件主轴表示垂直方向，交叉轴表示水平方向)上的对齐方式，可以有如下几个取值
            children: <Widget>[//是一个数组，
              Text('test Row '),
              Container(
                width: 50.0,
                height: 50.0,
                color: Colors.lightGreen,
              ),
              Text('world')
            ],
          ),*/


          //14：包含多個子widget的容器：Column：
     /*     body:Column(

            children: <Widget>[
              Text('test column'),
              Text('row1'),
              Text('row2'),
              Text('row3'),
            ],
          )*/

     //15 ， stack组件,Stack组件类似于Android中的FrameLayout，
          // 其中的子组件是一层层堆起来的，并不像Row或者Column中的子组件，按水平或垂直方向排列，下面用代码说明

     /*     body: Stack(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.greenAccent,
              ),

              Container(
                width: 30.0,
                height: 40.0,
                color: Colors.redAccent,
              ),
            ],
          ),*/

     //16, IndexedStack组件。
          // IndexedStack的构造方法中有个index属性，上面的index属性为1，则显示的是children数组中的第2个元素（
          // 绿色方块），如果index改为0，则显示的是第1个元素（红色方块），如果index的大小超过了children数组的长
          // 度，则会报错。


         /* body: IndexedStack(
            index: 0,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.orangeAccent,
                child: Center(
                  child: Text("index:0",style: TextStyle(fontSize: 20.0),),
                ),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.pink,
                child: Center(
                  child: Text("index:1",style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ],
          ),*/

         //17 .TableTable组件用于显示多行多列的布局，
          // 如果只有一行或者一列，使用Row或者Column更高效。下面用一段代码展示Table的用法：
     /*     body: Table(
            children: getData(),
          ),*/


        //wrap组件，可以在水平或垂直方向上多行显示其子组件，下面是示例代码：下列text会逐行显示，一行不够，就转下行

          body: Wrap(
            spacing: 5.0,// 水平方向上两个子组件的间距
            runSpacing: 20.0,// 两行的垂直间距
            children: <Widget>[
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),
              Text('t1'),



            ],
          ),

        ));
  }

  List<TableRow> getData() {

    var data=[
      "hello",
      "wrold"
    ];

    List<TableRow> result=new List<TableRow>();//图形集合
    TextStyle style=new TextStyle(fontSize:15.0,fontWeight: FontWeight.bold);
    for(int i=0;i<data.length;i++)
      {
        String str=data[i];
        List<Widget> row=new List();//子row集合
        for(int j=0;j<str.length;j++)
          {
            row.add(Text("${str[j]}",style: style,));
          }
          result.add(TableRow(//图形集合装填子row集合
            children: row
          ));
      }
      return result;
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
