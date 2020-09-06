import 'package:flutter/material.dart';

///全屏查看图片
class FullScreemImageRoute extends StatefulWidget {
  FullScreemImageRoute({Key key, this.imageUrl}) : super(key: key);
  String imageUrl;

  @override
  _FullScreemImageState createState() {
    return _FullScreemImageState();
  }
}

class _FullScreemImageState extends State<FullScreemImageRoute> {
  final double HEIGHT = 200;

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
    return Container(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: HEIGHT,
              color: Colors.grey,
            ),
            Container(
              child: Image.network(
                widget.imageUrl,
                height: HEIGHT,
                fit: BoxFit.fill,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ],
    ),color: Colors.black,);
  }
}
