import 'package:flutter/material.dart';
import 'package:zuiflutter/view/text/ellipsis_text.dart';
import 'package:zuiflutter/view/textfield/single_line_edittext.dart';
import 'package:zuiflutter/view/item_view.dart';

class TextRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextState();
  }
}


class TextState extends State<TextRoute> {
  String text1 = "value1";
  String text1Note = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("文本类输入类控件"),
      ),
      body: ListView(
        children: <Widget>[
          ItemView(
            "左标题",
            text1,
            clickListener: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (buildContext) {
                return SingleLineEditTextRoute(
                  title: "标题",
                  content1: text1,
                  content2: text1Note,
                  saveClickListener: (String textContent, String textNote) {
                    setState(() {
                      text1 = textContent;
                      text1Note = textNote;
                    });
                  },
                  cancelClickListener: () {
                    print("cancel");
                  },
                );
              }));
            },
          ),
          Container(child:
          EllipsisText("1111111111111111111111111111222222222222222222222222222333333333333333"),
            margin: EdgeInsets.all(10),),
          Container(child: EllipsisText("1111111111111111111111111111222222222222222222222222222333333333333333444444444444444444445555555555555555556666666666666", maxLines: 3,),
          margin: EdgeInsets.all(10),),
        ],
      ),
    );
  }
}
