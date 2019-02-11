//先从CardDemo倒看，build里返回scafflod,其中listview中使用了
//TravelDestinationItem,而TravelDestinationItem的定义：
//包含一个SafeArea,其中container里包含card包含column包含sizebox包含stack,然后还有一个Positioned Widget要注意
//其中包含FittedBox,包含Text,之后，expanded里包含padding,包含column,之后又是Padding包含Text，和Padding平级的还有
//2个Text.和Expanded并行的还有ButtomTheme.bar,其中包含ButtonBar包含flatButton2个。

//MaterialDemoDocumentationButton  包含在另一个文件内，it's associated with route, 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f1/GalleryIcons.dart';
import 'package:url_launcher/url_launcher.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class TravelDestination {
  const TravelDestination({
    this.assetName,
    this.assetPackage,
    this.title,
    this.description,
  });

  final String assetName;
  final assetPackage;
  final String title;
  final List<String> description;

  bool get isValid=>assetName!=null &&title!null&&description?.length==3;
}
final List<TravelDestination> destinations=<TravelDestination>[
  const TravelDestination(
    assetName: 'places/india_thanjavur_market.png',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Top 10 Cities to Visit in Tamil Nadu',
    description: <String>[
      'Number 10 ',
          'thanjavur',
      'thanjavur,Tamil Nadu',
    ],
  ),
  const TravelDestination(
    assetName:'places/india_chettinad_silk_maker.png',
    assetPackage: _kGalleryAssetsPackage,
    title:'Artisans of Southern India',
    description: <String>[
      'Silk Spinners',
      'Chettinad',
      'Sivaganga, Tamil Nadu',
    ],

  )
];

class CardsDemo extends StatefulWidget{
static const String routeName='/amaterial/cards';
  @override
  _CardsDemoState createState() =>_CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {

  ShapeBorder _shape;//what
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Travel stream'),
       actions: <Widget>[
         MaterialDemoDocumentationButton(CardsDemo.routeName )
       ],
     ),
   );
  }
}

class MaterialDemoDocumentationButton extends StatelessWidget {


  MaterialDemoDocumentationButton(String routeName,{Key key}):documentationUrl=kDemoDocumentationUrl[routeName],
  assert(kDemoDocumentationUrl[routeName]!=null,
  'A documentation URL was not specified for demo route $routeName in kAllGalleryDemos',),
  super(key:key);
  final String documentationUrl;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon:const Icon(Icons.library_books),
    tooltip:'Api documentation',
    onPressed: ()=>launch(documentationUrl,forceWebView:true),
    );
  }
}

final Map<String, String> kDemoDocumentationUrl =
Map<String, String>.fromIterable(
  kAllGalleryDemos.where((GalleryDemo demo) => demo.documentationUrl != null),
  key: (dynamic demo) => demo.routeName,
  value: (dynamic demo) => demo.documentationUrl,
);

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    this.documentationUrl,
    @required this.buildRoute,
  }) : assert(title != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final IconData icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;//define router Url ,
  final String documentationUrl;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

class GalleryDemoCategory {
  const GalleryDemoCategory._({ this.name, this.icon });
  @required final String name;
  @required final IconData icon;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType)
      return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}


const GalleryDemoCategory _kDemos=GalleryDemoCategory._(
  name: 'Studies',
  icon: GalleryIcons.animation,
);

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

List<GalleryDemo> _buildGalleryDemos
    () {
  var _kDemos;//include a properities :name,  & a icon
  final List<GalleryDemo> galleryDemos=<GalleryDemo>[
    //Demos
  GalleryDemo(title: 'Shrine',
  subtitle: 'Basic shopping app',
  icon:GalleryIcons.shrine,
  category: _kDemos,
/*
  routeName: ShrineDemo.routerName,
  buildRoute:(BuildContext context)=>const ShrineDemo(), //这个牵涉文件太多 todo
*/
  ),
  ];
}