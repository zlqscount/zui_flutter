import 'package:flutter/material.dart';

///封装Image.network图片加载
class LoadImgView extends Stack {
  String imgUrl;
  List<Widget> childWidget = [];
  LoadImgView(this.imgUrl){
    childWidget = [
      Container(
        height: HEIGHT,
        width: WIDTH,
        color: Colors.grey,
      ),
      Image.network(
        imgUrl,
        height: HEIGHT,
        fit: BoxFit.fill,
        width: WIDTH,
      )
    ];
  }

  final double HEIGHT = 100;
  final double WIDTH = 100;

  @override
  AlignmentGeometry get alignment => Alignment.center;

  @override
  List<Widget> get children {
    return childWidget;
  }
}
