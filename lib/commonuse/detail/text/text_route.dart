import 'package:flutter/material.dart';
import 'package:zuiflutter/commonuse/detail/text/detail/single_line_edittext.dart';
import 'package:zuiflutter/view/common_view.dart';

class TextRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextState();
  }
}

class TextState extends State<TextRoute> {
  String text1 = "value";
  String text1Note = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("文本类控件"),
      ),
      body: ListView(
        children: <Widget>[
          ItemView(
            "文本",
            text1,
            clickListener: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (buildContext) {
                return SingleLineEditTextRoute(
                  content1: text1,
                  content2: text1Note,
                  saveClickListener: (textContent, textNote) {
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
          )
        ],
      ),
    );
  }
}
