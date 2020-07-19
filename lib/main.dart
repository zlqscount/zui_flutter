import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zuiflutter/commonuse/common_use.dart';
import 'package:zuiflutter/splash/splash_route.dart';

void main() {
  runApp(MyApp());
  // 判断当前设备是否为安卓
  /*if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }*/
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Components'),
    );
  }*/
}

class MyAppState extends State {
  bool isMainRoute = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isMainRoute
          ? MyHomePage(title: 'Components')
          : SplashRoute(() {
              setState(() {
                isMainRoute = true;
              });
            }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

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
        onTap: (index) {
          setState(() {
            selectIndex = index;
            switch (index) {
              case 0:
                widget.title = "Components";
                break;
              case 1:
                widget.title = "Helper";
                break;
              case 2:
                widget.title = "Lab";
                break;
            }
          });
        },
      ),
    );
  }

  List<Widget> _widgetContent = <Widget>[
    CommomUse(),
    Text(
      'Index 1: Helper',
    ),
    Text(
      'Index 2: Lab',
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
