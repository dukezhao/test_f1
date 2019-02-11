import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';

// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
/**
 * card demo :
 * Card 类似 carview ,只能有一个子widget ,但是可以是很多选项，通过设elevation，来改变侧立面，即阴影效果。
    A Card, from the Material Components library, contains related nuggets of information and
    can be composed from almost any widget, but is often used with ListTile. Card has a single
    child, but its child can be a column, row, list, grid, or other widget that supports multiple
    children. By default, a Card shrinks its size to 0 by 0 pixels. You can use SizedBox to
    constrain the size of a card.

    In Flutter, a Card features slightly rounded corners and a drop shadow, giving it a 3D effect.
    Changing a Card’s elevation（侧立面） property allows you to control the drop shadow effect. Setting
    the elevation to 24.0, for example, visually lifts the Card further from the surface and causes
    the shadow to become more dispersed. For a list of supported elevation values, see Elevation and
    Shadows in the Material guidelines. Specifying an unsupported value disables the drop shadow
    entirely.
 * */

// a class defined for show the core Widget ,测试ok 
class _MyHomePgeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //define core wdiget
    var card = SizedBox(
      height: 210.0,
      child: Card(
        child: Column(
          //子是Column
          children: [
            ListTile(
              title: Text(' 1525 main Street',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('my cigy , ca 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('(408) 555-1212',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('consta@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );

    //if here miss Scaffold , will throw exception:，就是没有返回，上边只是定义了card ,
    //结构是：SizeBox包含card->包含Column->包含ListTile
/*    The following assertion was thrown building MyHomePage(dirty, state: _MyHomePgeState#582a9):
    I/flutter ( 3940): A build function returned null.
    I/flutter ( 3940): The offending widget is: MyHomePage
    I/flutter ( 3940): Build functions must never return null. To return an empty space that causes the building widget to
    I/flutter ( 3940): fill available room, return "new Container()". To return an empty space that takes as little room as
    I/flutter ( 3940): possible, return "new Container(width: 0.0, height: 0.0)".
    I/flutter ( 3940):
    I/flutter ( 3940): When the exception was thrown, this was the stack:
    I/flutter ( 3940): #0      debugWidgetBuilderValue.<anonymous closure>*/

    return Scaffold(
      appBar: AppBar(
        title :Text(widget.title),
      ),
      body: Center(
        child: card,
      ),
    );


  }
}
//引用到MyApp中的Home中的，material app的Home中的一部分，
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePgeState createState() => _MyHomePgeState();
}


 void main()
 {
   runApp(MyApp());
 }

class MyApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test card demo ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(title:'Flutter Demo for card now ',),
    );
  }
}
