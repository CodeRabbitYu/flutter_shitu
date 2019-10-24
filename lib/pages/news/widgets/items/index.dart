///
/// Create by Rabbit on 2019/10/20.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/news/news_list.dart';
import 'package:flutter_shitu/pages/news/widgets/items/image_item.dart';
import 'package:flutter_shitu/pages/news/widgets/items/text_item.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({Key key, this.item, this.clipperImage}) : super(key: key);

  final News_list item;
  final clipperImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: <Widget>[
          TextItem(text: item.text),
          ImageItem(
            image: item.cdn_img,
            imageHeight: double.parse(item.height),
            imageWidth: double.parse(item.width),
            clipperImage: clipperImage,
          ),
        ],
      ),
    );
  }
}
