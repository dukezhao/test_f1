import 'package:flutter/material.dart';
/**
 *
 * RaisedButton ,floatingActionButton, FlatButton（有问题，没出来）,menuButton o
 * PopupenuButton ，
 * 测试ok,
 *
 * */
main() {
  runApp(new MyApp());
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Test button",
      home: Scaffold(
        //new Scaffold 是老代码
        appBar: AppBar(title: Text('Test button ')),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Raised Button'),
              onPressed: () {},
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.list), onPressed: () {}),
            PopupMenuButton<WhyFarther>(
                onSelected: (WhyFarther result) {}, //未实现，
                //: ,//注意这里的代码写法，xxxbuilder,
                //todo PopupMenuEntry 类和PopupMenuItem为flutterSDK里定义好的容器
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.harder,
                        child: Text('Working a lot harder'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.smarter,
                        child: const Text('Being a lot smarter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.selfStarter,
                        child: const Text('Being a self-starter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.tradingCharter,
                        child:
                            const Text('Placed in charge of trading charter'),
                      ),
                    ]
            )
          ],
        ),
      ),
    );
  }
}
