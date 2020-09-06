import 'package:flutter/material.dart';
import 'package:zuiflutter/view/image/fullimage/full_screem_image.dart';
import 'package:zuiflutter/view/image/loadimg/load_img.dart';

///图片加载控件
class ImageLoadRoute extends StatefulWidget {
  ImageLoadRoute({Key key}) : super(key: key);

  @override
  _ImageLoadState createState() {
    return _ImageLoadState();
  }
}

class _ImageLoadState extends State<ImageLoadRoute> {
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
    String imgUrl =
        "http://pic4.bbzhi.com/jingxuanbizhi/jingmeidiannaozhuomianbizhixiazai/jingmeidiannaozhuomianbizhixiazai_400724_5.jpg";
    return new Scaffold(
      appBar: AppBar(
        title: Text("图片加载控件"),
      ),
      body: ListView(
        children: [
          LoadImgView(imgUrl),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  imgUrl,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                return FullScreemImageRoute(imageUrl: imgUrl,);
              }));
            },
          )
        ],
      ),
    );
  }
}
