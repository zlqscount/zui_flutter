import 'package:flutter/material.dart';
import 'package:zuiflutter/commonuse/detail/text/text_route.dart';

///components模块
class CommomUse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommomUseState();
  }
}

class CommomUseState extends State<CommomUse> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Color(0xffe8e8e8),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1, //设置空白的横线大小
            crossAxisSpacing: 1,
          ),
          children: <Widget>[
            ItemContainer(
              name: "Text",
              clickListener: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (buildContext) {
                  return TextRoute();
                }));
              },
            ),
            ItemContainer(
              name: "Button",
            ),
            ItemContainer(
              name: "appBar",
            ),
            ItemContainer(
              name: "dialog",
            ),
          ],
        ),
      ),
    );
  }
}

class ItemContainer extends Container {
  String name;
  Function clickListener;

  ItemContainer({this.name = "——", this.clickListener});

  @override
  Widget get child {
    return GestureDetector(
      onTap: () {
        if (clickListener != null) {
          clickListener();
        }
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
