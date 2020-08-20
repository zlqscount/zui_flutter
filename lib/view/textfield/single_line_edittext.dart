import 'package:flutter/material.dart';
import 'package:zuiflutter/utils/text/text_utils.dart';

///单行输入框
class SingleLineEditTextRoute extends StatefulWidget {
  Function saveClickListener, cancelClickListener;
  String title, content1, content2, editTextHint1, editTextHint2;
  TextStyle textStyle1, textStyle2;

  @override
  State<StatefulWidget> createState() {
    return _SingleLineEditTextState();
  }

  SingleLineEditTextRoute({
    this.saveClickListener,
    this.cancelClickListener,
    this.title = "",
    this.content1,
    this.content2,
    this.editTextHint1 = "请在这里输入",
    this.editTextHint2 = "备注",
    this.textStyle1 = const TextStyle(fontSize: 15, color: Color(0xff444444)),
    this.textStyle2 = const TextStyle(fontSize: 12, color: Color(0xff444444)),
  });
}

class _SingleLineEditTextState extends State<SingleLineEditTextRoute> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController controller1, controller2;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController(text: widget.content1);
    controller2 = TextEditingController(text: widget.content2);
    controller1.addListener(() {
      widget.content1 = controller1.text;
    });
    controller2.addListener(() {
      widget.content2 = controller2.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          getTopBar(),
          Offstage(
            offstage: !TextUtils.strNoteNull(widget.title),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 14,
                ),
                Text(
                  TextUtils.outPutNoneNullStr(widget.title),
                  style: TextStyle(color: Color(0xff444444), fontSize: 18),
                )
              ],
            ),
          ),
          getContent()
        ],
      )),
    );
  }

  Row getTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (widget.cancelClickListener != null) {
              widget.cancelClickListener();
            }
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.saveClickListener != null) {
              widget.saveClickListener(widget.content1, widget.content2);
            }
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(right: 10, bottom: 5),
            child: Text(
              "保存",
              style: TextStyle(color: Colors.blueAccent),
            ),
            decoration: BoxDecoration(),
          ),
        )
      ],
    );
  }

  Column getContent() {
    return Column(
      children: <Widget>[
        TextField(
          style: widget.textStyle1,
          controller: controller1,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.editTextHint1,
              contentPadding: EdgeInsets.all(15)),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(color: Color(0xffebebeb)),
          height: 1,
        ),
        Offstage(
          offstage: !TextUtils.strNoteNull(widget.content2),
          child: TextField(
            style: widget.textStyle2,
            controller: controller2,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Color(0xff999999)),
                hintText: widget.editTextHint2,
                contentPadding: EdgeInsets.all(15)),
          ),
        ),
      ],
    );
  }
}
