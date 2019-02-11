
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';

// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;


//demo 18 Stack ,passed test ok .




class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context) {
   var stack=Stack(
     alignment: const Alignment(0.6,0.6),//align to what ?
     children: [
       CircleAvatar(//system decalied already UI
         backgroundImage: AssetImage('images/pic.jpg'),
         radius: 100.0,
       ),
       Container(//pay attention to this appear new Container , why
         decoration: BoxDecoration(
           color: Colors.black45,//which part be paint color ?

         ),
         child: Text(//appear a sub class again , this time is child , why not container ?
           'Mia B',
           style: TextStyle(
             fontSize: 20.0,
             fontWeight: FontWeight.bold,
             color:Colors.white,
           ),
         ),
       ),
     ],
   );
   //...todo this should add the Scaffold , why ?
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Center(//center is UI or a layout position?
        child:stack ,//upper customized ,
      ),
    );
  }

}


//replicate from former Demo :
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;

@override
_MyHomePageState createState() =>_MyHomePageState();

}

void main()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Demo 18 :Stack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo homepage:for Stack now ',) ,
    );
  }
}


//code end 。。。