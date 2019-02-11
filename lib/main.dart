// Create an infinite scrolling lazily loaded list

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//demo 9 no code , only guide

/** todo 以下等用到再深入 关于 响应widget生命周期事件
 * state
 * 在StatefulWidget调用createState之后，框架将新的状态对象插入树中，然后调用状态对象的initState。
 * 子类化State可以重写initState，以完成仅需要执行一次的工作。 例如，您可以重写initState以配置动画或订
 * 阅platform services。initState的实现中需要调用super.initState。

    当一个状态对象不再需要时，框架调用状态对象的dispose。 您可以覆盖该dispose方法来执行清理工作。例如，
    您可以覆盖dispose取消定时器或取消订阅platform services。 dispose典型的实现是直接调用super.dispose。
 *
 *
 *
 * Key
    主要文章: Key_

    您可以使用key来控制框架将在widget重建时与哪些其他widget匹配。默认情况下，框架根据它们的runtimeType和它们的显
    示顺序来匹配。 使用key时，框架要求两个widget具有相同的key和runtimeType。

    Key在构建相同类型widget的多个实例时很有用。例如，ShoppingList构建足够的ShoppingListItem实例以填充其可见区域：

    如果没有key，当前构建中的第一个条目将始终与前一个构建中的第一个条目同步，即使在语义上，列表中的第一个条目如果滚动出
    屏幕，那么它将不会再在窗口中可见。

    通过给列表中的每个条目分配为“语义” key，无限列表可以更高效，因为框架将同步条目与匹配的语义key并因此具有相似（或
    相同）的可视外观。 此外，语义上同步条目意味着在有状态子widget中，保留的状态将附加到相同的语义条目上，而不是附加到
    相同数字位置上的条目。

    全局 Key
    主要文章: GlobalKey

    您可以使用全局key来唯一标识子widget。全局key在整个widget层次结构中必须是全局唯一的，这与局部key不同，后者只需要
    在同级中唯一。由于它们是全局唯一的，因此可以使用全局key来检索与widget关联的状态。
 * */



//demo 8 :整合之前所有，一个购物车应用app ,应用程序显示出售的各种产品，
// 并维护一个购物车。 我们先来定义ShoppingListItem
/*
class Product {
  //类似是数据类？
  const Product({this.name});

  final String name;
}
//购物车变化时监听，
typedef void CartChangedCallback(Product product, bool inCart); //类似接口？

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
     : product = product,//属性? 错， 这里叫成员变量，该ShoppingListItem widget是无状态的。
  // 它将其在构造函数中接收到的值存储在final成员变量中，然后在build函数中使用它们


  // 此外由于 ShoppingListItem是widget是无状态的。它将其在构造函数中接收到的值存储在final成员变量中:
  //
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;//inCart布尔值表示在两种视觉展示效果之间切换：一个使用当前主题的主色，另一个使用灰色
  final CartChangedCallback onCartChanged;//监听对象实例

  Color _getColor(BuildContext context) {
    //此主题依赖于BuildContext， because different parts of the tree   can have different themes.  The BuildContext indicates where the build is
    //taking place and therefore which theme to use.
    //查BuildContext 类：/// [BuildContext] objects are actually [Element] objects. The [BuildContext]
    ///// interface is used to discourage direct manipulation of [Element] objects.
    return inCart ? Colors.black54 : Theme
        .of(context)
        .primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context)
  {
    if(!inCart) return null;
    return new TextStyle(color: Colors.black54,//TextStyle : is a type of flutter special text style
    decoration: TextDecoration.lineThrough,// /// Draw a line through each line of text
    );
  }
  @override
  Widget build(BuildContext context) {//ShoppingListItem 的回调构造方法：build
   return new ListTile(

     //当用户点击列表项时，widget不会直接修改其inCart的值。相反，widget会调用其父widget给它的onCartChanged回调函数
     // 。 此模式可让您在widget层次结构中存储更高的状态，从而使状态持续更长的时间。在极端情况下，存储传给runApp应用程序
     // 的widget的状态将在的整个生命周期中持续存在。


     onTap: (){

//当父项收到onCartChanged回调时，父项将更新其内部状态，这将触发父项使用新inCart值重建ShoppingListItem新实例。
// 虽然父项ShoppingListItem在重建时创建了一个新实例，但该操作开销很小，因为Flutter框架会将新构建的widget与先前
// 构建的widget进行比较，并仅将差异部分应用于底层RenderObject。

       onCartChanged(product,!inCart);// click the cart , change , call the callback interface
     },

     leading: new CircleAvatar(//leading 就是在文字前的icon图标，也可以是头像
       backgroundColor: _getColor(context),
       child: new Text(product.name[0]),//leading的子控件，text。，然后在build函数中使用它们
     ),
     title: new Text(product.name,style: _getTextStyle(context)),//和leading 平级的title,
   );
  }
}


// 看父wdget存储状态变化的示例
//新建类 ShoppingList
class ShoppingList extends StatefulWidget{

  ShoppingList({Key key,this.products}):super(key:key);//products 也是从构造函数进来给final 的成员变量，存储？
  final List<Product> products;
// The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.//即statefulWidget可以复用
  
  //this overload method create a ShoppingList instance that match the associated position in the tree
  @override
  State<StatefulWidget> createState() =>new _ShopingListState();



}
*/
/**
 * }
    ShoppingList类继承自StatefulWidget，这意味着这个widget可以存储状态。 当ShoppingList首次插入到树中时，
    框架会调用其 createState 函数以创建一个新的_ShoppingListState实例来与该树中的相应位置关联（请注意，我们通
    常命名State子类时带一个下划线，这表示其是私有的）。

    当这个widget的父级重建时，父级将创建一个新的ShoppingLis//父级重建 概念？todo
    t实例，但是Flutter框架将重用已经在树中的_ShoppingListState实例，而不是再次调用createState创建一个新的。

    要访问当前ShoppingList的属性，_ShoppingListState可以使用它的widget属性。 如果父级重建并创建一个新的Shop
    pingList，那么 _ShoppingListState也将用新的widget值重建（译者语：这里原文档有错误，应该是_ShoppingList
    tate不会重新构建，但其widget的属性会更新为新构建的widget）。 如果希望在widget属性更改时收到通知，则可以覆盖
    didUpdateWidget函数，以便将旧的oldWidget与当前widget进行比较。

    处理onCartChanged回调时，_ShoppingListState通过添加或删除产品来改变其内部_shoppingCart状态。 为了通知框
    架它改变了它的内部状态，需要调用setState。调用setState将该widget标记为”dirty”(脏的)，并且计划在下次应用程序
    需要更新屏幕时重新构建它。 如果在修改widget的内部状态后忘记调用setState，框架将不知道您的widget是”dirty”(脏
    的)，并且可能不会调用widget的build方法，这意味着用户界面可能不会更新以展示新的状态。

    通过以这种方式管理状态，您不需要编写用于创建和更新子widget的单独代码。相反，您只需实现可以处理这两种情况的bui
    ld函数。
 *
 * *//*

class _ShopingListState extends State<ShoppingList>
{

  Set<Product> _shoppingCart=new Set<Product>();// 为了通知框架它改变了它的内部状态，需要调用setState

  void _handleCartChanged(Product product,bool inCart)
  {
    setState(() {
      //when user change what's in the cart, we need to change shoppingCart inside a setState call to trigger
      //a rebuild , the framework then calls build , below ,which updates the visual appearance of the app.
   if(inCart)
     {
       _shoppingCart.add(product);
       
     }
     else 
       {
         
         _shoppingCart.remove(product);
       }
   
    });
  }
  
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("购物车列表"),
     ),
     body: new ListView(
       padding: new EdgeInsets.symmetric(vertical: 8.0),
       children: widget.products.map((Product product){
         return new ShoppingListItem(
           product: product,
           inCart: _shoppingCart.contains(product),
           onCartChanged: _handleCartChanged,
         );
       }).toList(),
     ),
   );
  }

}
//主入口函数 :
void main()
{
  runApp(new MaterialApp(title: "购物车app",
  home: new ShoppingList(
    products: <Product>[
      new Product(name: 'eggs'),
      new Product(name: 'flour'),
      new Product(name: 'chocolate chips '),
    ],
  ),));
}
*/

//demo 7 , 在Flutter中，事件流是“向上”传递的，而状态流是“向下”传递的（译者语：这类似于
// React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态）
// ，重定向这一流程的共同父元素是State。让我们看看这个稍微复杂的例子是如何工作的：
//注意我们是如何创建了两个新的无状态widget的！我们清晰地分离了 显示 计数器（CounterDisplay）
// 和 更改 计数器（CounterIncrementor）的逻辑。 尽管最终效果与前一个示例相同，但责任分离允许将复杂性逻辑封装在各个widget中，同时保持父项的简单性。

//效果： 点击increament ， count会++

/*void main() {
  *//* runApp(new Center(child:CounterIncrementor()));*//*

  runApp(new Center(
      child: new Directionality(
          textDirection: TextDirection.ltr, child: new Counter())));
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count:$count', textDirection: TextDirection.ltr);
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text(
        'increment',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increment),
      new CounterDisplay(count: _counter)
    ]);
  }
}*/

//demo 6 remmember status's widget,有bug未实验出

//StatefulWidgets是特殊的widget，它知道如何生成State对象，
// 然后用它来保持状态。 思考下面这个简单的例子，其中使用了前面提到RaisedButton：

/*void main(){

  runApp(new Center(child: Counter()));
}*/
/*class Counter extends StatefulWidget {


//此类是状态的配置，它持有父类传送的值和被用于状态的build方法， Fields in a Widget subclass are always marked "final".

//todo 测试下列记住状态的自定义counter
  @override
  _CounterState createState() => new _CounterState(); //_CounterState 是自定义类
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized （优化）to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
        children: <Widget>[
          new RaisedButton
            (onPressed: _increment,
            child: new Text('Increment',textDirection: TextDirection.ltr,),),
          new Text('Count:$_counter',textDirection: TextDirection.ltr,),
        ],
    );
  }
}*/
//todo 以上bug未修复，见note,

//5 demo 使用手势

/*void main() {
  runApp(new Center(
    child: MyBtn(),
  )
  );
}

class MyBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        print('MyBtn was tapped!');
      },
      onVerticalDragDown: (dr) {
        print('onVerticalDragDown'); //另一个手势， 竖直向下手势
      },
      child: new Container(
        height: 36,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5),
            color: Colors.lightGreen[500]
        ),
        child: new Center(
          child: new Text('Engage', textDirection: TextDirection
              .ltr), //这里demo 少了设一个TextDirection.ltr,后加上
        ),
      ),
    );
  }
}*/
//当点btn时候，console 会打印MyBtn was tapped！

//4th demo：使用material 控件

/*

void main(){
  runApp(new MaterialApp(

    title: "flut turorial ",
    home:new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.

    //现在我们已经从MyAppBar和MyScaffold切换到了AppBar和 Scaffold widget， 我们的应用程序现在看起来已经有一些“Material”了！
    // 例如，应用栏有一个阴影，标题文本会自动继承正确的样式。我们还添加了一个浮动操作按钮，以便进行相应的操作处理。
    //
    //请注意，我们再次将widget作为参数传递给其他widget。该 Scaffold widget 需要许多不同的widget的作为命名参数，其中的每一个
    // 被放置在Scaffold布局中相应的位置。 同样，AppBar 中，我们给参数leading、actions、title分别传一个widget。 这种模式在整个框架中会经常出现，这也可能是您在设计自己的widget时会考虑到一点。
return new Scaffold(
  appBar: new AppBar(
    leading: new IconButton(icon: new Icon(Icons.menu),
        tooltip: 'navigation menu',
        onPressed: null,
    ),
    title: new Text('test demo 4 '),
    actions: <Widget>[
      new IconButton(icon: new Icon(Icons.search), 
          tooltip: 'Search',
          onPressed: null,
      ),
    ],
  ),

  //occupy most screen 
  body: new Center(
    
    child: new Text('hello demo 4'),
  ),
  //add floatingActionButton:
    floatingActionButton:new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null)
);
    
  }
}


*/

//3rd Demo : use simple widget : appbar和search icon在MyScaffold里
/*

在MyAppBar中创建一个Container，高度为56像素（像素单位独立于设备，为逻辑像素），
其左侧和右侧均有8像素的填充。在容器内部， MyAppBar使用Row 布局来排列其子项。
中间的title widget被标记为Expanded, ，这意味着它会填充尚未被其他子项占用的的
剩余可用空间。Expanded可以拥有多个children， 然后使用flex参数来确定他们占用剩
余空间的比例。

MyScaffold 通过一个Column widget，在垂直方向排列其子项。在Column的顶部，放置
了一个MyAppBar实例，将一个Text widget作为其标题传递给应用程序栏。将widget作为
参数传递给其他widget是一种强大的技术，可以让您创建各种复杂的widget。最后，MySc
affold使用了一个Expanded来填充剩余的空间，正中间包含一条message。

*/
/*
void main() {
  runApp(new MaterialApp(

    title: 'my app',
    home: new MyScaffold(),
  ));

}
class MyappBar extends StatelessWidget {
  MyappBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]), //what's ?
      //Row is horizontal 's linear layout
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            //Tooltip是继承于StatefulWidget的一个Widget，
            // 它并不需要其他借助于类似showDialog、showModalBottomSheet
            // 或者SnackBarAction类似的方法来调出，当用户长按被Tooltip包裹的Widget时，会自动弹出相应的操作提示。
            tooltip: 'Navigation menu',
            onPressed: null, //null will disable btn
          ),
          new Expanded(// 中间的title widget被标记为Expanded, ，这意味着它会填充尚未被其他子项占用
            // 的的剩余可用空间。 Expanded可以拥有多个children， 然后使用flex参数来确定
            // 他们占用剩余空间的比例
            //Expanded expands its child to fill the available space
            child: title,
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
          ),
        ],
      ),
    );
  }
}

//类似于一个容器
class MyScaffold extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(

      // Column is 垂直方向的线性布局.
      child: new Column(

        children: <Widget>[
          new MyappBar(//此处引入app bar,第一个子view,也是顶部，
            title: new Text(
          'Example title ',
          style: Theme.of(context).primaryTextTheme.title,
          ),
          ),
          new Expanded(child: new Center(//再次使用Expended来填充剩余空间，中间包含一个message :如下的child :
            child: new Text('hello upper!'),
          ),),
        ],
      ),
      );

  }
}*/

//2nd Demo :https://flutterchina.club/widgets-intro/

/*void main()
{
  runApp(
    new Center(
      child: new Text(
        '南无本师释迦摩尼佛，'
            '南无楞严会上佛菩萨，'
            '南无阿弥陀佛，'
            '南无大悲观世音菩萨'
            '，南无金刚藏菩萨',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}*/

//first Demo ,pick favorite from current list to favorite box
/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Startup Name Generator',
      //chage the theme 's color code begin ...
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      //chage the theme 's color code end ...
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<
      WordPair>(); //添加保存收藏列表的结合,a store set that flutter has specially ;usage：save user favorite words

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          //add new code....在 RandomWordsState 的 build 方法中为 AppBar 添加一个列表图标。当用户点击列表图标时，包含收藏夹的新路由页面入栈显示。
          new IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved) //_pushSaved 即按下的方法，
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(
        pair); //add, ensure that words has not been add to favorited list yet
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //添加图形
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        //若已收藏，是Icons.favorite这个图，否则是Icons.favorite_border 即空心红心
        //添加颜色
        color: alreadySaved ? Colors.red : null,
      ), //颜色设置，如果已收藏是红色，否则无色
      //添加交互
      onTap: () {
        setState(() {
          // Flutter 的响应式风格的框架中，调用 setState() 会为 State 对象触发 build() 方法，从而导致对 UI 的更新
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add((pair));
          }
        });
      }, // ... onTap()方法一直到这里
    );
  }

//当用户点击导航栏中的列表图标时）我们会建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由，
// 新页面的内容会在 MaterialPageRoute 的 builder 属性中构建，builder 是一个匿名函数。

//添加 Navigator.push 调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）

  //接下来，添加 MaterialPageRoute 及其 builder。 现在，添加生成 ListTile 行的代码，ListTile 的
  // divideTiles() 方法在每个 ListTile 之间添加 1 像素的分割线。 该 divided 变量持有最终的列表项，
  // 并通过 toList()方法非常方便的转换成列表显示。

  //builder 返回一个 Scaffold，其中包含名为"Saved Suggestions"的新路由的应用栏。
  // 新路由的body 由包含 ListTiles 行的 ListView 组成；每行之间通过一个分隔线分隔。
  void _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map(
        (WordPair pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );

      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      //添加水平分割符

      return new Scaffold(
        appBar: new AppBar(
          title: const Text("saved suggesstions"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }
}*/
