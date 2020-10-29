import 'package:flutter/material.dart';
import 'package:zuiflutter/view/button/self_button.dart';

class ButtonRoute extends StatefulWidget {
  ButtonRoute({Key key}) : super(key: key);

  @override
  _ButtonState createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<ButtonRoute> {
  int count2 = 0;

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
        title: Text("按钮类控件"),
      ),
      body: new Builder(builder: (BuildContext context) {
        //在new Builder下才能使用SnackBar
        return ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            SelfStyleButton(
              "矩形按钮 SquareButton 按下弹出snake bar",
              MClickListener: () {
                showSnakeBar(context, '这是一个SnackBar ' + (count2++).toString());
              },
              bgColor: Colors.blueAccent,
              textStyle: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            SelfStyleButton(
              "矩形按钮 自适应宽度",
              MClickListener: () {},
              bgColor: Colors.blueAccent,
              textStyle: TextStyle(color: Colors.white),
              fitSelf: true,
            ),
          ],
        );
      }),
    );
  }

  void showSnakeBar(BuildContext context, String tx){
    final snackBar = new SnackBar(
      content: new Text(tx ?? ""),
      action: new SnackBarAction(
          label: "撤销",
          onPressed: () {
            Scaffold.of(context).hideCurrentSnackBar();
          }),
    );
    //context要使用new Builder(builder: (BuildContext context)的
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
