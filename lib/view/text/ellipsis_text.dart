import 'package:flutter/material.dart';
import 'package:zuiflutter/utils/text/text_utils.dart';

///带省略号的文本控件
class EllipsisText extends Container {
  String _text;
  TextStyle textStyle;
  int maxLines;

  EllipsisText(this._text,
      {this.textStyle =
          const TextStyle(color: Color(0xff444444), fontSize: 15), this.maxLines = 1});

  @override
  Widget get child => Text(
        TextUtils.breakWord(_text),
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      );
}
