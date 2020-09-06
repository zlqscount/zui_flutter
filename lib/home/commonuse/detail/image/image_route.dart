import 'package:flutter/material.dart';
import 'package:zuiflutter/home/commonuse/detail/image/banner/banner_route.dart';
import 'package:zuiflutter/home/commonuse/detail/image/imageload/image_load_route.dart';
import 'package:zuiflutter/view/item_view.dart';

class ImageRoute extends StatefulWidget {
  ImageRoute({Key key}) : super(key: key);

  @override
  _ImageState createState() {
    return _ImageState();
  }
}

class _ImageState extends State<ImageRoute> {
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
        title: Text("图片相关控件"),
      ),
      body: ListView(
        children: [
          ItemView(
            "轮播图",
            "",
            clickListener: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return BannerRoute();
              }));
            },
          ),
          ItemView(
            "图片加载",
            "",
            clickListener: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ImageLoadRoute();
              }));
            },
          ),
        ],
      ),
    );
  }
}
