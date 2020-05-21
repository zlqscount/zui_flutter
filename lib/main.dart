import 'package:flutter/material.dart';
import 'package:zuiflutter/commonuse/common_use.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetContent.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets), title: Text("Components")),
          BottomNavigationBarItem(
              icon: Icon(Icons.help), title: Text("Helper")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_system_daydream), title: Text("Lab")),
        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapChangeContent(selectIndex),
      ),
    );
  }

  Function onItemTapChangeContent(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  List<Widget> _widgetContent = <Widget>[
    CommomUse(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];
}

class ItemContainer extends Container {
  String name;
  String imgAssets;
  Function function;

  ItemContainer(
      {this.name = "——",
      this.imgAssets = 'images/ic_flutter.png',
      this.function});

  @override
  Widget get child {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function();
        }
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(imgAssets),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                name,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
