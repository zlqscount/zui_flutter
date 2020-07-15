
import 'package:flutter/material.dart';

///单行输入框
class SingleLineEditTextRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SingleLineEditTextState();
  }

}

class _SingleLineEditTextState extends State{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("单行输入框"),
      ),
      body: Column(children: <Widget>[
      ],),
    );
  }

}