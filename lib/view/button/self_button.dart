import 'package:flutter/material.dart';

class CommonButton extends Container {
  String tx;
  Function MClickListener;
  BorderSide borderSide;
  Color backgroundColor;
  TextStyle textStyle;

  ///是否自适应
  bool fitSelf;

  ///通用按钮
  CommonButton(this.tx,
      {this.MClickListener,
      this.textStyle,
      this.backgroundColor = const Color(0xffebebeb),
      this.fitSelf = false,
      this.borderSide = const BorderSide(
        width: 1,
        color: Color(0xffe8e8e8),
        style: BorderStyle.solid,
      )});

  @override
  get onPressed => MClickListener;

  @override
  Widget get child {
    Widget childContainer = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: StadiumBorder(
          side: borderSide,
        ),
      ),
      child: Text(
        tx,
        style: textStyle,
        softWrap: true,
      ),
    );
    return GestureDetector(
      child: fitSelf
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[childContainer],
            )
          : childContainer,
      onTap: () {
        if (MClickListener != null) {
          MClickListener();
        }
      },
    );
  }
}
