import 'package:flutter/material.dart';

class TextRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextState();
  }
}

class TextState extends State<TextRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("文本类控件"),
      ),
      body: ListView(
        children: <Widget>[Text("text")],
      ),
    );
  }
}
