/**
A mix-and-match approach
For some widgets, a mix-and-match approach makes the most sense. In this scenario,
the stateful widget manages some of the state, and the parent widget manages other aspects of the state.

In the TapboxC example, on tap down, a dark green border appears around the box. On tap up,
the border disappears and the box’s color changes. TapboxC exports its _active state to its parent but manages 
its _highlight state internally. This example has two State objects, _ParentWidgetState and _TapboxCState.*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

//混合控制状态模式，test passed
//------------parentWidget------------------
class ParentWidget extends StatefulWidget {
  bool _active = false;

  @override
  _ParentWidgetState createState() /*=> _ParentWidgetState();*/
  {
    return  _ParentWidgetState();
  }
}
//one state
class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {

    print('_ParentWidgetState _handleTapboxChanged is call : $newValue');
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//-------------------------------------TapboxC----------------------------------
class TapboxC extends StatelessWidget {
  final bool  active;
  final ValueChanged<bool> onChanged;


  //other state :
  _TapboxCState createState() => _TapboxCState();//TapboxC Specially
  void _handleTap()
  {
    print('child _handleTap : $active');
    onChanged(!active);
  }
  TapboxC({Key key, this.active:false, @required this.onChanged}):super(key:key){
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

class _TapboxCState extends State<TabboxC>
{
      bool _highlight=false;

  @override
  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
return GestureDetector(
  onTapDown: _handTapDown,
  onTap: _handleTap,
  onTapUp:_handleTapUp,
  onTapCancel: _handleTapCancel,
  child: Container(
    child: Center(
      child: Text(
        widget.active?'Active':'Inactive',
        style: TextStyle(
          fontSize: 32.0,color: Colors.white
        )),

      ),
    width: 200.0,
    height: 200.0,
    decoration: BoxDecoration(
      color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
      border: _highlight?Border.all(
        color: Colors.teal[700],
        width: 10.0,
      ):null,
    ),
    ),
  );
  }

  void _handTapDown(TapDownDetails details) {
    setState(() {
      _highlight=true;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);//和其他_handleXXX不同
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight=false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight=false;
    });
  }
}

class TabboxC extends StatefulWidget
{
TabboxC({Key key,this.active:false,@required this.onChanged}):super(key:key);
final bool active;
final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() =>_TapboxCState();

}



//-------------------------------------MyApp----------------------------------

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test mixMatchApproach manages the widget’s state',
      home: Scaffold(
        appBar: AppBar(
          title:Text('test mixMatchApproach manages the widget’s state') ,
        ),
        body: Center(
          //child: new TapboxC()//will NOT WORK

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