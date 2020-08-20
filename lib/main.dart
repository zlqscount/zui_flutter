import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zuiflutter/home/commonuse/components.dart';
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
    ComponentsRoute(),
    Text(
      'Index 1: Helper',
    ),
    Text(
      'Index 2: Lab',
    ),
  ];
}

