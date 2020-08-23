import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zuiflutter/view/button/self_button.dart';
import 'package:zuiflutter/view/item_view.dart';

class ButtonRoute extends StatefulWidget {
  ButtonRoute({Key key}) : super(key: key);

  @override
  _ButtonState createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<ButtonRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("按钮类控件"),
      ),
      body: ListView(
        children: <Widget>[
          CommonButton(
            "按下弹出flutter toast",
            MClickListener: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                  msg: "按下弹出 flutter toast " + (count++).toString(),
                  fontSize: 13);
            },
          )
        ],
      ),
    );
  }
}
