import 'package:flutter/material.dart';

///item项
class ItemView extends StatelessWidget {
  final String name, value;

  Function clickListener;

  TextStyle nameStyle;
  TextStyle valueStyle;
  double divideLineHeight;
  Color divideLineColor;
  Container arrowContainer;

  ItemView(this.name, this.value,
      {this.clickListener,
        this.nameStyle = const TextStyle(
            color: Color(0xff444444), fontSize: 15),
        this.valueStyle = const TextStyle(
            color: Color(0xff999999), fontSize: 15),
        this.divideLineHeight = 0.5,
        this.divideLineColor = const Color(0xff999999),
        this.arrowContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (clickListener != null) {
          clickListener();
        }
      },
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: nameStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          value,
                          style: valueStyle,
                        ),
                      ),
                      arrowContainer == null
                          ? Icon(
                        Icons.chevron_right,
                        color: Color(0xff999999),
                      )
                          : arrowContainer
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              height: divideLineHeight,
              decoration: BoxDecoration(color: divideLineColor),
            ),
          )
        ],
      ),
    );
  }
}
