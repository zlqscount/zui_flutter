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
  int count = 0;
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
        return ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            CommonButton(
              "CommonButton $count",
              MClickListener: () {
                setState(() {
                  count++;
                });
              },
            ),
            SizedBox(
              height: 5,
            ),
            CommonButton(
              "CommonButton 按下弹出snake bar",
              fitSelf: true,
              MClickListener: () {
                final snackBar = new SnackBar(
                  content: new Text('这是一个SnackBar ' + (count2++).toString()),
                  action: new SnackBarAction(
                      label: "撤销",
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                      }),
                );
                //context要使用new Builder(builder: (BuildContext context)的
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
            SizedBox(
              height: 5,
            ),
          ],
        );
      }),
    );
  }
}
