import 'package:flutter/material.dart';

///轮播图
class BannerRoute extends StatefulWidget {
  BannerRoute({Key key}) : super(key: key);

  @override
  _BannerState createState() {
    return _BannerState();
  }
}

class _BannerState extends State<BannerRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("轮播图控件"),
      ),
      body: ListView(
        children: [


        ],
      ),
    );
  }
}
