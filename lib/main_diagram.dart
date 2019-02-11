// Create an infinite scrolling lazily loaded list

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/app.dart';
import 'package:test_f1/icons.dart';
import 'package:url_launcher/url_launcher.dart';

// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
//demo 18 Card :move to CardDemo .dart


//demo 18 Stack ,passed test ok .move to StackDemo.dart


//demo 17 otherdemo :https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/colors_demo.dart
//设置listview不同的背景色，从material design palette 获取， 测试ok .

/*const double kColorItemHeight = 48.0;

class Palette {
  Palette({this.name, this.primary, this.accent, this.threshold = 900});

  final String name;
  final MaterialColor primary;

  final MaterialAccentColor accent;
  final int threshold;

  bool get isValid => name != null && primary != null && threshold != null;
}
//相当于定义一个tab controller 实际上也是如此
final List<Palette> allPalettes = <Palette>[
  Palette(name: 'RED',
      primary: Colors.red,
      accent: Colors.redAccent,
      threshold: 300),
  Palette(name: 'PINK',
      primary: Colors.pink,
      accent: Colors.pinkAccent,
      threshold: 200),
  Palette(name: 'PURPLE',
      primary: Colors.purple,
      accent: Colors.purpleAccent,
      threshold: 200),
  Palette(name: 'DEEP PURPLE',
      primary: Colors.deepPurple,
      accent: Colors.deepPurpleAccent,
      threshold: 200),
  Palette(name: 'INDIGO',
      primary: Colors.indigo,
      accent: Colors.indigoAccent,
      threshold: 200),
  Palette(name: 'BLUE',
      primary: Colors.blue,
      accent: Colors.blueAccent,
      threshold: 400),
  Palette(name: 'LIGHT BLUE',
      primary: Colors.lightBlue,
      accent: Colors.lightBlueAccent,
      threshold: 500),
  Palette(name: 'CYAN',
      primary: Colors.cyan,
      accent: Colors.cyanAccent,
      threshold: 600),
  Palette(name: 'TEAL',
      primary: Colors.teal,
      accent: Colors.tealAccent,
      threshold: 400),
  Palette(name: 'GREEN',
      primary: Colors.green,
      accent: Colors.greenAccent,
      threshold: 500),
  Palette(name: 'LIGHT GREEN',
      primary: Colors.lightGreen,
      accent: Colors.lightGreenAccent,
      threshold: 600),
  Palette(name: 'LIME',
      primary: Colors.lime,
      accent: Colors.limeAccent,
      threshold: 800),
  Palette(name: 'YELLOW', primary: Colors.yellow, accent: Colors.yellowAccent),
  Palette(name: 'AMBER', primary: Colors.amber, accent: Colors.amberAccent),
  Palette(name: 'ORANGE',
      primary: Colors.orange,
      accent: Colors.orangeAccent,
      threshold: 700),
  Palette(name: 'DEEP ORANGE',
      primary: Colors.deepOrange,
      accent: Colors.deepOrangeAccent,
      threshold: 400),
  Palette(name: 'BROWN', primary: Colors.brown, threshold: 200),
  Palette(name: 'GREY', primary: Colors.grey, threshold: 500),
  Palette(name: 'BLUE GREY', primary: Colors.blueGrey, threshold: 500),
];

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key key,
    @required this.index,
    @required this.color,
    this.prefix = '',
  })
      :assert(index != null),
        assert(color != null),
        assert(prefix != null),
        super(key: key);

  final int index;
  final Color color;
  final String prefix;//前缀？

  String colorString()=>"#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  @override
  Widget build(BuildContext context) {
    return Semantics(//todo
      container: true,
      child: Container(
        height: kColorItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0
        ),
        color: color,
        child: SafeArea(
            top: false,//?
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('$prefix$index'),
                Text(colorString())
              ],
            ),
        ),
      ),
    );
  }
}


class PaletteTabView extends StatelessWidget {

  PaletteTabView({
    Key key,
    @required this.colors
  })
      :assert(
  colors != null && colors.isValid
  ),
        super(key: key);
  final Palette colors;
  static const List<int> primaryKeys = <int>[
    50, 100, 200, 300, 400, 500, 600, 700, 800, 900]; //主键
  static const List<int> accentKeys = <int>[100, 200, 400, 700]; //
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    final TextStyle whiteTextStyle = textTheme.body1.copyWith(
        color: Colors.white);
    final TextStyle blackTextStyle = textTheme.body1.copyWith(
        color: Colors.black);


    final List<Widget> colorItems = primaryKeys.map<Widget>((int index) {
      return DefaultTextStyle( //todo a stype for text ?
        style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
        child: ColorItem(
            index: index, color: colors.primary[index]),
      );
    }).toList();

    if (colors.accent != null) {
      colorItems.addAll(accentKeys.map<Widget>((int index) {
        return DefaultTextStyle(
          style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
          child: ColorItem(
            index: index, color: colors.accent[index], prefix: 'A',),
        );
      }).toList());
    }

    return ListView(
      itemExtent: kColorItemHeight, //item的指定滚动范围
      children: colorItems,
    );
  }
}

//source has no runApp(ColorsDemo()) ,it's need to be added byyourself

class ColorsDemo extends StatelessWidget{
  static const String routeName ="/colors";
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: allPalettes.length,//先告诉系统这个tab的宽度，即有多少个tab ,
     child: Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         title: const Text('Colors'),
         bottom: TabBar(
           isScrollable: true,
             tabs: allPalettes.map<Widget>((Palette swatch)=>Tab(text: swatch.name)).toList(),),
       ),
         body: TabBarView(children:allPalettes.map<Widget>((Palette colors){
           return PaletteTabView(colors: colors);
         }).toList(),
         ),
     ),

   );
  }
}


void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo 16 test listview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorsDemo (),
    );
  }
}*/
//demo 16 ListView ,测试ok ,一个上边是电影院列表，下边餐厅列表的listview Ok
//ListView is simple list of tiles vertical or horizontally showing,
// a demo fake from:https://github.com/flutter/website/blob/master/src/_includes/code/layout/listview/main.dart
/*

void main()
{
  //debugPaintSizeEnabled=true;如果打开会显示布局边界和提示，
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo 16 test listview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage (title:'listtest homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;

  @override
  _MyhomepageState createState() =>_MyhomepageState();



}

List<Widget> list=<Widget>[
  ListTile(//flutter official widget:https://docs.flutter.io/flutter/material/ListTile-class.html,ListTile是一个易于使用的小部件，具有前后图标属性以及最多3行文本。

    title: Text('CineArts at the Empire',
      style: TextStyle(fontWeight: FontWeight.w500,fontSize:20.0)),
    subtitle: Text('85 w Portal Ave'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('The Castro Theater',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('429 Castro St'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('Alamo Drafthouse Cinema',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('2550 Mission St'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('Roxie Theater',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('3117 16th St'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('United Artists Stonestown Twin',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('501 Buckingham Way'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('AMC Metreon 16',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('135 4th St #3000'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  Divider(),
  ListTile(
    title: Text('K\'s Kitchen',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('757 Monterey Blvd'),
    leading: Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('Emmy\'s Restaurant',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('1923 Ocean Ave'),
    leading: Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('Chaiya Thai Restaurant',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('272 Claremont Blvd'),
    leading: Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('La Ciccia',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('291 30th St'),
    leading: Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
];

class _MyhomepageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 5.0,//removeing the drop shadow cast by the app bar.移掉由app bar造成的阴影，
      ),
      body: Center(//todo center 表示位置？
        child: ListView(
          children:list,//see upper list ,a  widget

        ),
      ),
    );
  }
}


*/


//demo 15 GridView test
//flutter 的gridview 自动scroll when detected its contents are too long to fit the render box ,
//Lays widgets out in a grid ,means 把小部件放在网格中，

//Uses GridView.extent 和Uses GridView.count 的不同
// 测试1 ，//Uses GridView.extent,结果显示3个一行的图片的gridview, ok

//代码结构：由 materialapp中包含,MyHomepge 控件（负责状态），其包含：_MyHomePageState，其包含Scaffold，
// 其buildGrid里先构建GridView.extent,其中包含格式，和子：_buildGridTileList ,其返回的是list<Container>容器列表，容器列表内填充一组Image

/*void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView UI ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GridView extent test '),
    );
  }

}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState()=>_MyHomePageState();
}

//some comments :
// The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.

//图片填充
List<Container> _buildGridTileList(int count)
{
  return List<Container>.generate(count,(int index)=>Container(
  child:Image.asset('images/pic${index+1}.jpg')//有序递增的名字，
  ) );//第二个参数，generator

}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: buildGrid(),
      ),
    );
  }
}


//格式控制
Widget buildGrid(){//返回类型Widget ?? todo
  return GridView.extent(
    maxCrossAxisExtent: 150,//todo 参数意义？
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  children:_buildGridTileList(30),);
}*/

//todo 测试2 :Uses GridView.count,结果:太多代码需要其他类关联，暂停: last reference :
// https://github.com/flutter/flutter/blob/ab2d0323a765d297a3b7900112dbed2a562119af/examples/flutter_gallery/lib/gallery/demo.dart
// https://flutter.io/docs/development/ui/layout#nesting
//2018-12-21
/*
enum GridDemoTileStyle { imageOnly, oneLine, twoLine }

const double _KMinFlingVelocity = 800.0;
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

typedef BannerTapCallback = void Function(Photo photo);

class Photo {
  Photo({
    this.assetPackage,
    this.title,
    this.caption,
    this.assetName,
    this.isFavorite = false,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
  bool isFavorite;

  String get tag =>
      assetName; //assuming that all asset names are unique.将assetName设为不重复后，把assetName设为tag .
  //=>在Dart 作用？
  bool get isValid =>
      assetName != null &&
          title != null &&
          caption != null &&
          isFavorite != null; //todo what 's this meaning
}

class GridPhotoViewer extends StatefulWidget {
  //构造函数？
  const GridPhotoViewer({Key key, this.photo}) : super(key: key);

  final Photo photo; //属性？
  @override
  _GridPhotoViewerState createState() => _GridPhotoViewerState();
}

//grid view的每个的title类
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox( // see https://segmentfault.com/a/1190000011949751#articleHeader12 ,这东西用来控制背景图，先理解为这样一个容器UI ,
      //first know has this type of UI
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}

class _GridPhotoViewerState extends State<GridPhotoViewer>
    with SingleTickerProviderStateMixin {
  //动画控制类
  AnimationController _controller;

  //动画偏移集合
  Animation<Offset> _flingAnimation;

  //偏移类实例
  Offset _offset = Offset.zero;
  double _scale = 1.0; //todo 意义是缩放比例？

  //另一个位移实例
  Offset _normalizedOffset;

  //之前缩放比例
  double _previousScale;

  @override
  void initState() {
    super.initState();
    //控制器初始化
    _controller = AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
  }

//类比 onDestory()? todo
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //最大位移值0.0 ?todo why? if the size of the renderer's box is w,h
  //then the minimun offset value is w-_scale*w,h=_scale*h;
  Offset _clampOffset(Offset offset) {
    final Size size = context.size; //flutter中的类Size，
    final Offset minOffset = Offset(size.width, size.height) * (1.0 - _scale);
    return Offset(offset.dx.clamp(minOffset.dx, 0.0),
        offset.dy.clamp(minOffset.dy, 0.0)); //返回一个强制在一定范围内的值，x,y
  }


  //抛，掷相关动画
  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale; //前一个缩放比例？

      //forcalPoint: /// The initial focal point of the pointers in contact with the screen.
      //初始化焦点，与屏幕联系的点的焦点
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      print("details.focalPoint:" + details.focalPoint.toString()); //打印测试
      print("offset:" + _offset.toString()); //打印测试
      //the fling animation stops if an input gesture starts
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0); //两个参数分别代表下限和上限
      print("_scale:" + _scale.toString()); //打印测试
      //Ensure that image location under the focal point stays in the same place despite scaling
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);

      print("offset:" + _offset.toString()); //打印测试
    });
  }


  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance; //todo
    print("magnitude:" + magnitude.toString()); //打印测试

    if (magnitude < _KMinFlingVelocity) //滑动的值小于一个最小阀值时，不响应
      return;
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = _controller.drive(Tween<Offset>( //_flingAnimation设置

        begin: _offset,
        end: _clampOffset(_offset + direction * distance)
    ));
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  //_GridPhotoViewerState's build override
  @override
  Widget build(BuildContext context) {
    // return a GestureDetector {}
    return GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      child: ClipRect(
        child: Transform(transform: Matrix4.identity()
          ..translate(_offset.dx, _offset.dy)
          ..scale(_scale),
          child: Image.asset(
            widget.photo.assetName,
            package: widget.photo.assetPackage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class GridDemoPhotoItem extends StatelessWidget {

  GridDemoPhotoItem({
    Key key,
    @required this.photo,
    @required this.onBannerTap,
    @required this.tileStyle
  })
      :assert(photo!null && photo.isValid),
  //assert：校验，ensure the photo is not null , , photo is not valid ,
        assert(tileStyle != null),
        assert(onBannerTap != null),
        super(key: key); //此段写法 ,invoke paresent's construct method
  final Photo photo;
  final GridDemoTileStyle tileStyle;
  final BannerTapCallback onBannerTap; // User taps on the photo's header or footer.

  void showPhoto(BuildContext context) {
    Navigator.push(context, MaterialPageRoute<void>(
      //  /// Construct a MaterialPageRoute whose contents are defined by [builder].
      //  ///
      //  /// The values of [builder], [maintainState], and [fullScreenDialog] must not
      //  /// be null.


        builder: (BuildContext context) {
          return Scaffold(

            appBar: AppBar(
                title: Text(photo.title)
            ),
            body: SizedBox.expand(
              child: Hero( //why call this hero,flutter new animation collection , can transfer from routers ,
                //https://flutterchina.club/animations/hero-animations/
                tag: photo.tag,
                child: GridPhotoViewer(photo: photo),
              ),
            ),
          );
        }
    ));
  }

  // GridDemoPhotoItem's build
  @override
  Widget build(BuildContext context) {
    final Widget image = GestureDetector(
        onTap: () {
          showPhoto(context);
        },
        child: Hero(
            key: Key(photo.assetName),
            tag: photo.tag,
            child: Image.asset(
              photo.assetName,
              package: photo.assetPackage,
              fit: BoxFit.cover,
            )
        )
    );

    final IconData icon = photo.isFavorite ? Icons.star : Icons.star_border;


    switch (tileStyle) {
      case GridDemoTileStyle.imageOnly:
        return image;
      case GridDemoTileStyle.oneLine:
      //grid
        return GridTile(

          header: GestureDetector(
            onTap: () {
              onBannerTap(photo);
            },

            child: GridTileBar(
              title: _GridTitleText(photo.title),
              backgroundColor: Colors.black45,
              leading: Icon(icon //what's leading
                , color: Colors.white,
              ),
            ),
          ),
          child: image,
        );


      case GridDemoTileStyle.twoLine:
        return GridTile(

          footer: GestureDetector(
            onTap: () {
              onBannerTap(photo);
            },

            child: GridTileBar(

              backgroundColor: Colors.black45,
              title: _GridTitleText(photo.title),
              subtitle: _GridTitleText(photo.caption),
              //why this use subtitle , differ with above
              trailing: Icon(
                icon,
                color: Colors.white,

              ),
            ),
          ),
          child: image,
        );
    }
    assert(tileStyle != null);
    return null;
  }
}


//定义具体listDemo实体类
class GridListDemo extends StatefulWidget {
  const GridListDemo({Key key}) :super(key: key);
  static const String routeName = '/material/grid-list';

  @override
  State<StatefulWidget> createState() => GridListDemoState();
}

class GridListDemoState extends State<GridListDemo> {
  GridDemoTileStyle _tileStyle = GridDemoTileStyle
      .twoLine; //means 2line 's style ?


  List<Photo> photos = <Photo>[
    Photo(assetName: 'place/india_chennai_flower_market.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'chennai', caption: 'Flower Market',),
    Photo(
      assetName: 'places/india_tanjore_bronze_works.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Bronze Works',
    ),
    Photo(
      assetName: 'places/india_tanjore_market_merchant.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'places/india_tanjore_thanjavur_temple.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'places/india_tanjore_thanjavur_temple_carvings.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'places/india_pondicherry_salt_farm.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Salt Farm',
    ),
    Photo(
      assetName: 'places/india_chennai_highway.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chennai',
      caption: 'Scooters',
    ),
    Photo(
      assetName: 'places/india_chettinad_silk_maker.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chettinad',
      caption: 'Silk Maker',
    ),
    Photo(
      assetName: 'places/india_chettinad_produce.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chettinad',
      caption: 'Lunch Prep',
    ),
    Photo(
      assetName: 'places/india_tanjore_market_technology.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'places/india_pondicherry_beach.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Beach',
    ),
    Photo(
      assetName: 'places/india_pondicherry_fisherman.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Fisherman',
    ),
  ];


  changeTileStyle(GridDemoTileStyle value) {
    setState(() {
      _tileStyle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid list'),
        actions: <Widget>[

          MaterialDemoDocumentationButton(GridListDemo
              .routeName) //todo 找不到这个类， MaterialDemoDocumentationButton
        ],
      ),
    );
    return null;
  }
}


final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    this.documentationUrl,
    @required this.buildRoute,

  })
      :assert(title != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final IconData icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;
  final String documentationUrl;

}

class GalleryDemoCategory {
  const GalleryDemoCategory._({this.name, this.icon});

  @required final String name;
  @required final IconData icon;

  //todo


  //对"==" 重载，refer https://api.dartlang.org/stable/2.1.0/dart-core/Object/operator_equals.html

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType) //todo ?runtimeType 对象的及试运行表现类型
      return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon); //rewrite hashCode
  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

//various val to  show different type of DemoGategory,
const GalleryDemoCategory _kDemos = GalleryDemoCategory._(
    // ignore: const_initialized_with_non_constant_value, invalid_constant
    name: 'Studies', icon: GalleryIcons.animation);


//_kstyle

const GalleryDemoCategory _KStyle=GalleryDemoCategory._(name: 'Style',icon:GalleryIcons.custom_typography);


//_kMaterialComponents todo

final List<GalleryDemo> KAllGalleryDemos=_buildGalleryDemos();

List<GalleryDemo> _buildGalleryDemos() {


  final List<GalleryDemo> galleryDemos=<GalleryDemo>[

    //Demos
    GalleryDemo(title: 'Shrine',
    subtitle: 'baskc  shopping app',
    icon: GalleryIcons.shrine,
    category: _kDemos,
    routeName:ShrineDemo.routeName,
    buildRoute: (BuildContext context)=>const ShrineDemo(),),
    //todo other same block coding .....


  ];
}

class ShrineDemo extends StatelessWidget {


  const ShrineDemo({Key key}):super(key:key);
  static const String routeName='/shrine';// Used by the Gallery app.
@override
  Widget build(BuildContext context) =>ShrineApp();
}

class MaterialDemoDocumentationButton extends StatelessWidget {

  final String documentationUrl;

  static var routeName;//todo 临时解决找不到routeName,

  MaterialDemoDocumentationButton(String routerName, {Key key })
      :
        documentationUrl=kDemoDocumentationUrl[routerName],
        assert(
        kDemoDocumentationUrl[routerName] != null,
        'a documentation URL was not specified for demo , router $routeName in KAllGalleryDemos',
        ),
        super(key: key);




  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.library_books),
      tooltip: 'API documentation',
      onPressed: () => launch(documentationUrl, forceWebView: true),
    );
  }
}
final Map<String, String>kDemoDocumentationUrl = Map < String, String>.fromIterable
(
//todo 2019-1-10
KAllGalleryDemos.where((GalleryDemo demo)=>demo.documentationUrl!=null),
key: (dynamic demo)=>demo.routeName,
value:(dynamic demo)=>demo.documentationUrl,

);*/

//demo 14 container 例子，一个一行2图片的gridview 实现, 测试ok.
/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'grid view',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter grid view '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(
          //一般用padding ,这里用了BoxDecoration
          color: Colors.black26),
      child: Column(
        //首先是一个整列，把整个最外边的这布局理解为column，
        children: [
          Row(
            //每一行
            children: [
              Expanded(
                //意义下边注释过，这里理解为可扩展，可变的一个子容器
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0)), //圆角弧度系数
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/pic1.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0)), //圆角弧度系数
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/pic2.jpg'),
                ),
              )
            ],
          ),
          //other Row begin
          Row(
            //每一行
            children: [
              Expanded(
                //意义下边注释过，这里理解为可扩展，可变的一个子容器
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0)), //圆角弧度系数
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/pic3.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0)), //圆角弧度系数
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/pic4.jpg'),
                ),
              )
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: container,
      ),
    );
  }
}*/
//demo 13：嵌套布局（nesting row and columns ）
//step1 ,定义各个布局，2，返回materialApp，在home中把各个子控件装载。 尺寸还不能适配手机。

/*
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titleText = Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Strawberry pavlova",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
          fontSize: 10,
        ),
      ),
    );

    var subTitle = Text('''
    Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. 
    Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
    ''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 6,
      ),
    );

    //5 stas rating row

    var ratings = Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),

            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: "Roboto",
              letterSpacing: 0.2,
              fontSize: 4.5,
            ),

          )
        ],
      ),
    );

    // 定义一个textStyle
    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w100,
      fontFamily: 'Roboto',
      letterSpacing: 0.1,
      fontSize: 10.0,
      height: 1.0,

    );

    //DefaultTextStyle.merge allow you to create a default text
    //stylw that's inherited by its child and all subsequent children.

    var iconList = DefaultTextStyle.merge(
      style: descTextStyle, // use above style
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row( //总的一行
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    // leftColumn which column ? 即大页面上整个区分的，左边这个column ，

    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
      child: Column(
        children: [
          titleText, // 找源文件，文档没给
          subTitle, // 找源文件，文档没给
          ratings, // 找源文件，文档没给
          iconList,
        ],
      ),
    );

    var mainImage = Image.asset('images/pavlova.jpg', fit: BoxFit.fitWidth);

    //构建主material App,其实可以直接返回  Scaffold , 不用MeterialApp
    // 源码：https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/pavlova/main.dart


    return MaterialApp(
      title: "test LF & RG CKE",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("complex UI Testing II"),

        ),

        //从这里开始是总row,里边包含左边的column和右边的整体Imageview
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 50),

            height: 220.0,
            child: Card( //总的card
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.0,
                    child: leftColumn,
                  ),
                  mainImage,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//main方法中，runApp参数必须是一个widget的实例对象
void main() {
  debugPaintSizeEnabled = false;
  runApp(MyHomePage());
}
*/

//demo 12  Lay out multiple widgets vertically and horizontally ,水平三个五角星布局
//分三步骤：
//1.set up MyHomePage,主要用来记住状态
//2,_MyhomePageState类，实现UI ,
/*class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//普通不紧缩的 行列布局，只是一个大图laker.且不适配
 *//*class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(//Column
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //下述图片过大超过屏幕一行显示，而调整,,
               Image.asset("images/lake.jpg"),
            Image.asset("images/lake.jpg"),
            Image.asset("images/lake.jpg"),

           Expanded(
             child: Image.asset("images/lake.jpg"),
           ),
           Expanded(
             flex: 3,//放大为2倍
             child: Image.asset("images/lake.jpg"),

           ),
           Expanded(
             child: Image.asset("images/lake.jpg"),
           ),

               Icon(Icons.star, color: Colors.red[500]),
            Icon(Icons.star, color: Colors.red[500]),
            Icon(Icons.star, color: Colors.red[500]),
          ],
        ),
      ),
    );
  }
}*//*
//另一个控件 , packing widget ,紧缩的行/列效果，水平5个五角星在页面中央
*//*class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var packedRow = Row(
      mainAxisSize: MainAxisSize.min,//紧缩的行/列效果 使用的参数，
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: packedRow,
      ),
    );
  }
}*//*

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test complex 2",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "test home page ",
      ),
    );
  }
}

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}*/
//demo 11: flutter 's approach to layout
//this code can show visual layout , :  debugPaintSizeEnabled set to true so you can see the visual layout.
/*

void main() {
  //实际显示,如果text外部没有任何wrapper容器，需要设置textDirection.

  runApp(
    //new Text("hello single text",style:TextStyle(fontSize: 32.9),textDirection: TextDirection.ltr,));///单独呈现ok,必须给方向tetDirection
    // Image.asset("images/lake.jpg",fit:BoxFit.cover)  );//单独呈现ok,全屏幕，没有任何缩放

    //Icon(Icons.star, color: Colors.red[500],textDirection: TextDirection.ltr,)//单独呈现需要加方向TextDirection,效果为居中一个小红色五角星
     // Myapp());
// Image.asset("images/lake.png",fit:BoxFit.cover);

}*/

//demo 10 :
// follow https://flutterchina.club/tutorials/layout/ demo
/**
    step 0 make sure
    Create an images directory at the top of the project.
    Add lake.jpg. (Note that wget doesn’t work for saving this binary file.)
    Update the pubspec.yaml file to include an assets tag. This makes the image available to your code.
 */
/*
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
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ), //由于上边这个Column占据了此行的绝大部分空间，所以他必须被一个叫做Expanded Widget的控件wrapped
          //所以中间icon要写到Expanded的外部
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          //平级Text
          Text('41')
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
void main()
{
  runApp(MyApp());
}*/
//demo 9 no code , only guide text

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
/*class Product {
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
*/ /**
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
    * */ /*
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
}*/

//demo 7 , 在Flutter中，事件流是“向上”传递的，而状态流是“向下”传递的（译者语：这类似于
// React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态）
// ，重定向这一流程的共同父元素是State。让我们看看这个稍微复杂的例子是如何工作的：
//注意我们是如何创建了两个新的无状态widget的！我们清晰地分离了 显示 计数器（CounterDisplay）
// 和 更改 计数器（CounterIncrementor）的逻辑。 尽管最终效果与前一个示例相同，但责任分离允许将复杂性逻辑封装在各个widget中，同时保持父项的简单性。

//效果： 点击increament ， count会++

/*void main() {
  */ /* runApp(new Center(child:CounterIncrementor()));*/ /*

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
