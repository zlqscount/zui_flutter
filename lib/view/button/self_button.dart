import 'package:flutter/material.dart';

final double _BTN_DEFAULT_HEIGHT = 50;
final double _BTN_DEFAULT_RADIUS = 10;

///自定义样式按钮
class SelfStyleButton extends Container {
  String _tx;
  Function MClickListener;
  TextStyle textStyle;
  Color bgColor;

  double height;
  double radiusValue;

  ///是否自适应文字宽度
  bool fitSelf;

  SelfStyleButton(this._tx,
      {this.MClickListener,
      this.fitSelf,
      this.textStyle,
      this.bgColor,
      this.radiusValue,
      this.height});

  @override
  Widget get child {
    Widget childWidget = Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.center,
      height: (this.height == null || this.height == 0)
          ? _BTN_DEFAULT_HEIGHT
          : this.height,
      child: Text(
        _tx,
        style: textStyle,
      ),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular((radiusValue == null || radiusValue == 0)?_BTN_DEFAULT_RADIUS:radiusValue))),
    );
    return GestureDetector(
      onTap: () {
        if (MClickListener != null) {
          MClickListener();
        }
      },
      child: (fitSelf != null && fitSelf)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [childWidget],
            )
          : childWidget,
    );
  }
}
