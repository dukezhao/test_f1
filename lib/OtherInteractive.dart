import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
 * reference :https://flutter.io/docs/development/ui/interactive#step-2
 * other method to manager status ;可以自管，父类管，混合管理状态，取决于：
 * 1.If the state in question is user data, for example the checked or unchecked mode of a checkbox,
 * or the position of a slider, then the state is best managed by the parent widget.数据最好父类管
   2. If the state in question is aesthetic, for example an animation, then the state is best managed by
    the widget itself.动画自己管
 *
 * */
//其他管理状态的example :https://flutter.io/docs/development/ui/interactive#step-2
//from begin :We’ll give examples of the different ways of managing state by creating three simple examples:

//用到的类GestureDetector ，手指滑动触发tap：https://docs.flutter.io/flutter/widgets/GestureDetector-class.html
/*GestureDetector(
onTap: () {
setState(() { _lights = true; });
},
child: Container(
color: Colors.yellow,
child: Text('TURN LIGHTS ON'),
),
)*/
// TapboxA manages its own state.


//--------------- TapboxA 一个实现点击交互的box ,，点击后变绿，默认grey -----------------------
class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child:Center(//attention here add Center
          child: Text(
            _active ? 'active' : 'inactive',//Active or active are ok .
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active?Colors.lightGreen[700]:Colors.grey[600],
        ),
        ),

    );
  }
}

//---------------MyApp -----------------------

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test TapboxA :manage status by itself',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tapbox manager status itself"),
        ),
        body: Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}


void main()
{
  runApp(MyApp());

}