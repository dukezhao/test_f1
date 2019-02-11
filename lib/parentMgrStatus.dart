//The parent widget manages the widget’s state
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

//------------parentWidget------------------ TEST ok .
class ParentWidget extends StatefulWidget {
  bool _active = false;

  @override
  _ParentWidgetState createState() /*=> _ParentWidgetState();*/
  {
    return  _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {

    print('parent _handleTapboxChanged is call : $newValue');
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//-------------------------------------TapboxB----------------------------------
class TapboxB extends StatelessWidget {
  final bool  active;
  final ValueChanged<bool> onChanged;


  void _handleTap()
  {
    print('child _handleTap : $active');
    onChanged(!active);
  }
  TapboxB({Key key, this.active:false, @required this.onChanged}):super(key:key){
    print('Tap boxB init:${this.active}');
  }
  @override
  Widget build(BuildContext context) {
    print('Tap boxB build method');
    return GestureDetector(
      onTap: _handleTap,
      child:Container(
        child:Center(
          child: Text(
            active?'Active':'Inactive',
            style: TextStyle(fontSize: 32.0,color:Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration:BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600]
        )

      ),

    );

  }
}


//-------------------------------------MyApp----------------------------------

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test parent manages the widget’s state',
      home: Scaffold(
        appBar: AppBar(
          title:Text('test parent manages the widget’s state') ,
        ),
        body: Center(
          //child: new TapboxB()//will NOT WORK

          /**
           * I/flutter (12820): The following NoSuchMethodError was thrown while handling a gesture:
              I/flutter (12820): The method 'call' was called on null.
              I/flutter (12820): Receiver: null
              I/flutter (12820): Tried calling: call(true)
           *
           * */


          //
          child: ParentWidget(),//test ok
      /**    log
      : I/flutter (12820): Tap boxB init:false
        I/flutter (12820): Tap boxB build methodI/flutter (12820): child _handleTap : false
        I/flutter (12820): parent _handleTapboxChanged is call : true
        I/flutter (12820): Tap boxB init:true
        I/flutter (12820): Tap boxB build method*/


        ),
      ),
    );
  }



}

void main()
{
  runApp(MyApp());
}