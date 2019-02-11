
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';
//demo 10 :
// follow https://flutterchina.club/tutorials/layout/ demo
/**
    step 0 make sure
    Create an images directory at the top of the project.
    Add lake.jpg. (Note that wget doesn’t work for saving this binary file.)
    Update the pubspec.yaml file to include an assets tag. This makes the image available to your code.
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1. title Section
    Widget titleSection = Container(
      //titleSection，是效果图上的大的imageview下的那个title 区域，如果按horizontal的方式看，包含
      //左边的叠加的，上下2个text组合成一个column,之后是右边一个icon,再右边又一个text,  是一个container作为容器
      padding: const EdgeInsets.all(32.0),
      //EdgeInsets.all表示在所有方向上的padding ,left, top ,bottom,right 四个方向
      child: Row(
        //加入子控件，一行
        children: [
          //子控件集合
          Expanded(
            child: Column(
              //列
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //这一列中的，子控件集
                Container(
                  //列中子控件集中的一个：容器
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    //column容器中，的子控件之一，文本text
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  //和上一个Container平级的一个Text , 组合成最左边的一个column的上下2个text
                  "kandersteg,Switzerland",
                  style: TextStyle(color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          ), //由于上边这个Column占据了此行的绝大部分空间，所以他必须被一个叫做Expanded Widget的控件wrapped
          //所以中间icon要写到Expanded的外部
       /*   Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          //平级Text
          Text('41')*/

          //Replace by FavoriteWidget(), 代替 上述55~60 line ，实现加
          FavoriteWidget(),
        ],
      ),
    );

    //2. Implement the button row,即实现下一行图形，三个并列的btn
    //Since the code for building each row would be almost identical,
    // it’s most efficient to create a nested function, such as buildButtonColumn(),
    // which takes an Icon and Text, and returns a column with its widgets painted in the primary color.
    //使用nested fun 即：高效生成带文字的方法：buttonColumn
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min, //MainAxisSize,column的axis方向是垂直方向
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    //The build function adds the icon directly to the column. Put text into a Container to
    // add padding above the text, separating it from the icon.

    //Build the row containing these columns by calling the function and passing the icon and
    // text specific to that column. Align the columns along the main axis using MainAxisAlignment.
    // spaceEvenly to arrange the free space evenly before, between, and after each column.

    //再写一个widget 来整合一个Container,其包含一个行row，它的主轴是平均分配的，MainAxisAlignment.spaceEvenly,
    //children是三个上边的buildButtonColumn
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'Call'),
          buildButtonColumn(Icons.near_me, 'Route'),
          buildButtonColumn(Icons.share, 'Share')
        ],
      ),
    );

    //3.under the buttonSection 's text Section,即：Step 4: Implement the text section

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''this is a test , Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
          'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, '
          'followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees'
          ' Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,
      ),
    );

    //4 next , set a secction for Step 5: Implement the image section
    //that's follow step 9 to fetch the lake.jpg as below
    //put it in to MaterialApp directly

    //on upper step 3 has bee setup , the theme color ,
    //follow above step 4, will put jpg into our whole page together .
    return MaterialApp(
      //follow step 3
      title: "complexd flut demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("complex UI Design-Top Lakes "),
          ),
          //follow step 4
          body: ListView(
            //why body is undefined ?  ,coz body should be in a Scaffold ,Scaffold
            // 实现了基本的纸墨设计布局结构。在示例应用中，MyHomePage 所返回的就是一个Scaffold。
            // 也就是说， MaterialApp 的child 是Scaffold http://blog.chengyunfeng.com/?p=1042

            children: [
              Image.asset(
                'images/lake.jpg',
                width: 600.0,
                height: 240.0, //check whether is px , or dp
                fit: BoxFit.cover,
              ),
              // the 3 part of Section below image
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );

    //step 5 , put it together, 即Step 6: Put it together
    //继续完善MaterialApp
  }

}



//有状态管理的Widget ,

class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() =>_FavoriteWidgetState();
}

/* reference :https://flutter.io/docs/development/ui/interactive#step-2
* Step 3: Subclass State
The _FavoriteWidgetState class stores the mutable data that can change over the lifetime of the widget.
When the app first launches, the UI displays a solid red star, indicating that the lake has “favorite”
status, along with 41 likes. These values are stored in the _isFavorited and _favoriteCount fields:
* */
   class _FavoriteWidgetState extends State<FavoriteWidget>//_FavoriteWidgetState is the extends FavoriteWidget's status subclass
{
  bool _isFavorited=true;//default value
  int _favoriteCount=41;//default counts

  @override
  Widget build(BuildContext context) {//create 啊 row containing a red IconButton & Txt.
return Row(
  mainAxisSize: MainAxisSize.min,
/* 下文means 垂直方向聚拢，MainAxisSize：垂直方向上尺寸，min：最小
    By default, a row or column occupies as much space along its main axis as possible,
    but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min.
     The following example uses this property to pack the star icons together.
*/
children: [//[前的<widget>通常省略
  Container(
    padding: EdgeInsets.all(0.0),
    child: IconButton(icon: (_isFavorited?Icon(Icons.star):Icon(Icons.star_border)),color: Colors.red[500],
        onPressed: _toggleFavorite
    ),
  ),
  //other horizontal 's wdiget : Text :41 default value
  SizedBox(width: 18.0,//用Sizebox,width wrapper text 为防止数字变化时明显地跳跃。
  // Tip: Placing the Text in a SizedBox and setting its width prevents a discernible “jump” when the text
    // changes between the values of 40 and 41 — a jump would otherwise occur because those values have
    // different widths.
  child: Container(
    child: Text('$_favoriteCount'),
  ),)
],

);
  }

  void _toggleFavorite() {
    setState(() {//framework 固有方法
      if (_isFavorited)
        {
          _favoriteCount-=1;
          _isFavorited=false;
        }
        else
          {
            _favoriteCount+=1;
            _isFavorited=true;
          }
    });

  }
}





void main()
{
  runApp(MyApp());
}