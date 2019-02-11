import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test Dialog',
      home: Scaffold(
        appBar: AppBar(
          title: Text('test Dialog'),
        ),
        //  body: MySimpleDialogView(), 打开注释就是SimpleDialogView
        //todo
        body: MyAlertDialogView(),
      ),
    );
  }
}

//测试ok ,
class MyAlertDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        showDialog<Null>(
          context: context,
          barrierDismissible: false, //不能点击对话框外关闭对话框，必须点击按钮关闭
          builder: (BuildContext context) {
            //attention:builder:()
            return AlertDialog(//这里AlertDialog和SimpleDialog不同，
              title: Text('AlertDialog 提示'),
              content: Text('这是AlertDialog 提示，微软重申Windows '
                  '7将在2020年1月到达支持终点，公司希望利用这个机会说服用户'
                  '在最新更新发布之前升级到Windows 10'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      //onPressed:()一个方法
                      Navigator.of(context).pop();
                    },
                    child: Text('明白了'))
              ],
            );
          },
        ); //attention：<Null>
      },
    );
  }
}

class MySimpleDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('show simpleDialog'),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return SimpleDialog(
                title: Text('this is simpleDialog'),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('确定'),
                  ),
                  new SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('取消'),
                  ),
                ],
              );
            });
      },
    );
  }
}
